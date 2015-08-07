class MessagesController < ApplicationController
  before_action :require_current_user

  def index
    @current_messages = Message.current.includes(:user).reverse
  end

  def create
    current_user.messages.create(message_params)
    head :ok
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
