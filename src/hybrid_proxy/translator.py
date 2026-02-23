"""Protocol translation between Anthropic and OpenAI formats."""
import logging
from typing import Dict, Any, List, Optional
from datetime import datetime

logger = logging.getLogger(__name__)


class AnthropicToOpenAI:
    """Translate Anthropic API requests to OpenAI format."""

    @staticmethod
    def translate_request(anthropic_request: Dict[str, Any]) -> Dict[str, Any]:
        """
        Translate an Anthropic /v1/messages request to OpenAI /v1/chat/completions format.

        Anthropic format:
        {
            "model": "claude-3-5-sonnet-20241022",
            "max_tokens": 1024,
            "messages": [{"role": "user", "content": "Hello"}],
            "system": "Optional system prompt",
            "temperature": 0.7,
            "stream": false
        }

        OpenAI format:
        {
            "model": "gpt-4",
            "max_tokens": 1024,
            "messages": [{"role": "user", "content": "Hello"}],
            "temperature": 0.7,
            "stream": false
        }
        """
        openai_request = {
            "model": anthropic_request.get("model", "gpt-4"),
            "max_tokens": anthropic_request.get("max_tokens", 4096),
            "messages": anthropic_request.get("messages", []),
            "temperature": anthropic_request.get("temperature", 0.7),
            "stream": anthropic_request.get("stream", False),
        }

        # Add optional parameters if present
        if "top_p" in anthropic_request:
            openai_request["top_p"] = anthropic_request["top_p"]
        if "stop_sequences" in anthropic_request:
            openai_request["stop"] = anthropic_request["stop_sequences"]

        return openai_request

    @staticmethod
    def translate_response(openai_response: Dict[str, Any]) -> Dict[str, Any]:
        """
        Translate OpenAI chat completion response to Anthropic format.

        OpenAI format:
        {
            "id": "chatcmpl-123",
            "object": "chat.completion",
            "created": 1677652288,
            "model": "gpt-4",
            "choices": [{
                "index": 0,
                "message": {"role": "assistant", "content": "Hello!"},
                "finish_reason": "stop"
            }],
            "usage": {"prompt_tokens": 10, "completion_tokens": 5, "total_tokens": 15}
        }

        Anthropic format:
        {
            "id": "msg_123",
            "type": "message",
            "role": "assistant",
            "content": [{"type": "text", "text": "Hello!"}],
            "model": "claude-3-5-sonnet-20241022",
            "stop_reason": "end_turn",
            "usage": {"input_tokens": 10, "output_tokens": 5}
        }
        """
        choices = openai_response.get("choices", [])
        if not choices:
            return {
                "id": openai_response.get("id", f"msg_{datetime.now().timestamp()}"),
                "type": "message",
                "role": "assistant",
                "content": [{"type": "text", "text": ""}],
                "model": openai_response.get("model", "unknown"),
                "stop_reason": "end_turn",
                "usage": {"input_tokens": 0, "output_tokens": 0},
            }

        choice = choices[0]
        message = choice.get("message", {})
        content_text = message.get("content", "")

        # Handle Z.ai/GLM reasoning_content field (used when content is empty)
        if not content_text and "reasoning_content" in message:
            content_text = message.get("reasoning_content", "")
            logger.info(f"Using reasoning_content field (length: {len(content_text)})")

        logger.info(f"Translated response - content length: {len(content_text)}")

        anthropic_response = {
            "id": openai_response.get("id", f"msg_{datetime.now().timestamp()}"),
            "type": "message",
            "role": "assistant",
            "content": [{"type": "text", "text": content_text}],
            "model": openai_response.get("model", "unknown"),
            "stop_reason": AnthropicToOpenAI._map_finish_reason(choice.get("finish_reason", "stop")),
        }

        # Translate usage
        usage = openai_response.get("usage", {})
        anthropic_response["usage"] = {
            "input_tokens": usage.get("prompt_tokens", 0),
            "output_tokens": usage.get("completion_tokens", 0),
        }

        return anthropic_response

    @staticmethod
    def _map_finish_reason(openai_reason: str) -> str:
        """Map OpenAI finish_reason to Anthropic stop_reason."""
        mapping = {
            "stop": "end_turn",
            "length": "max_tokens",
            "content_filter": "stop_sequence",
            "tool_calls": "tool_use",
        }
        return mapping.get(openai_reason, "end_turn")


class OpenAIToAnthropic:
    """Translate OpenAI API requests to Anthropic format (for Claude API)."""

    @staticmethod
    def translate_request(openai_request: Dict[str, Any]) -> Dict[str, Any]:
        """
        Translate an OpenAI /v1/chat/completions request to Anthropic /v1/messages format.
        """
        anthropic_request = {
            "model": openai_request.get("model", "claude-3-5-sonnet-20241022"),
            "max_tokens": openai_request.get("max_tokens", 4096),
            "messages": openai_request.get("messages", []),
            "temperature": openai_request.get("temperature", 0.7),
        }

        # Map OpenAI 'stop' to Anthropic 'stop_sequences'
        if "stop" in openai_request:
            stop_value = openai_request["stop"]
            if isinstance(stop_value, str):
                anthropic_request["stop_sequences"] = [stop_value]
            else:
                anthropic_request["stop_sequences"] = stop_value

        if "top_p" in openai_request:
            anthropic_request["top_p"] = openai_request["top_p"]

        # Add system prompt if present in first message
        messages = openai_request.get("messages", [])
        if messages and messages[0].get("role") == "system":
            anthropic_request["system"] = messages[0]["content"]
            anthropic_request["messages"] = messages[1:]
        else:
            anthropic_request["messages"] = messages

        return anthropic_request

    @staticmethod
    def translate_response(anthropic_response: Dict[str, Any]) -> Dict[str, Any]:
        """
        Translate Anthropic message response to OpenAI chat completion format.
        """
        # Extract text content from Anthropic response
        content_blocks = anthropic_response.get("content", [])
        content_text = ""
        for block in content_blocks:
            if block.get("type") == "text":
                content_text += block.get("text", "")

        openai_response = {
            "id": anthropic_response.get("id", f"chatcmpl-{datetime.now().timestamp()}"),
            "object": "chat.completion",
            "created": int(datetime.now().timestamp()),
            "model": anthropic_response.get("model", "claude-3-5-sonnet-20241022"),
            "choices": [{
                "index": 0,
                "message": {
                    "role": "assistant",
                    "content": content_text,
                },
                "finish_reason": OpenAIToAnthropic._map_stop_reason(
                    anthropic_response.get("stop_reason", "end_turn")
                ),
            }],
        }

        # Translate usage
        usage = anthropic_response.get("usage", {})
        openai_response["usage"] = {
            "prompt_tokens": usage.get("input_tokens", 0),
            "completion_tokens": usage.get("output_tokens", 0),
            "total_tokens": usage.get("input_tokens", 0) + usage.get("output_tokens", 0),
        }

        return openai_response

    @staticmethod
    def _map_stop_reason(anthropic_reason: str) -> str:
        """Map Anthropic stop_reason to OpenAI finish_reason."""
        mapping = {
            "end_turn": "stop",
            "max_tokens": "length",
            "stop_sequence": "stop",
            "tool_use": "tool_calls",
        }
        return mapping.get(anthropic_reason, "stop")
