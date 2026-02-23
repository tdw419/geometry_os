"""Fallback handling for rate limits and errors."""
import logging
from typing import Dict, Any, Optional, AsyncIterator
from datetime import datetime

import aiohttp

from .config import config

logger = logging.getLogger(__name__)


class RateLimitError(Exception):
    """Raised when a 429 rate limit error is detected."""

    def __init__(self, response: Optional[Dict[str, Any]] = None):
        self.response = response
        super().__init__("Rate limit exceeded (429)")


class FallbackHandler:
    """Handle fallback from Claude API to LM Studio on rate limits."""

    def __init__(self, cfg: Optional[config.__class__] = None):
        self.cfg = cfg or config
        self._lm_studio_available = True

    def is_rate_limit_error(self, status_code: int, response_data: Optional[Dict[str, Any]] = None) -> bool:
        """
        Detect if a response indicates a rate limit error.

        Checks for:
        - HTTP 429 status code
        - Anthropic-specific rate limit error messages
        """
        if status_code == 429:
            return True

        # Check response body for rate limit indicators
        if response_data:
            error = response_data.get("error", {})
            error_type = error.get("type", "")
            error_message = error.get("message", "").lower()

            if "rate" in error_type.lower() or "rate" in error_message:
                return True

        return False

    async def execute_with_fallback(
        self,
        claude_request_fn,
        lm_studio_request_fn,
        request_data: Dict[str, Any],
    ) -> Dict[str, Any]:
        """
        Execute a request with Claude API, falling back to LM Studio on 429.

        Args:
            claude_request_fn: Async function that calls Claude API
            lm_studio_request_fn: Async function that calls LM Studio
            request_data: Original request data for logging

        Returns:
            Response dict from either Claude or LM Studio
        """
        if not self.cfg.enable_fallback:
            # Fallback disabled, try Claude only
            return await claude_request_fn()

        # Try Claude API first
        try:
            logger.info("Attempting Claude API request...")
            response = await claude_request_fn()
            logger.info("Claude API request successful")
            return response
        except RateLimitError as e:
            logger.warning(f"Rate limit detected (429), falling back to LM Studio")
        except aiohttp.ClientResponseError as e:
            if self.is_rate_limit_error(e.status, getattr(e, "response_data", None)):
                logger.warning(f"Rate limit detected (HTTP {e.status}), falling back to LM Studio")
            else:
                # Not a rate limit error, re-raise
                logger.error(f"Claude API request failed with HTTP {e.status}")
                raise
        except Exception as e:
            # Check if it's a rate limit wrapped in another exception
            if "rate" in str(e).lower() or "429" in str(e):
                logger.warning(f"Rate limit detected in error message, falling back to LM Studio")
            else:
                logger.error(f"Claude API request failed: {e}")
                raise

        # Fallback to LM Studio
        try:
            logger.info("Executing fallback to LM Studio...")
            fallback_response = await lm_studio_request_fn()

            # Log the fallback
            self._log_fallback(request_data, "success")

            return fallback_response
        except Exception as e:
            logger.error(f"Fallback to LM Studio failed: {e}")
            self._log_fallback(request_data, "failed")
            raise

    async def stream_with_fallback(
        self,
        claude_stream_fn: AsyncIterator[Dict[str, Any]],
        lm_studio_stream_fn: AsyncIterator[Dict[str, Any]],
        request_data: Dict[str, Any],
    ) -> AsyncIterator[Dict[str, Any]]:
        """
        Execute a streaming request with Claude API, falling back to LM Studio on 429.

        This is more complex for streaming - we need to detect 429 in the first chunk.
        """
        if not self.cfg.enable_fallback:
            async for chunk in claude_stream_fn:
                yield chunk
            return

        try:
            async for chunk in claude_stream_fn:
                # Check if first chunk is an error
                if chunk.get("type") == "error":
                    error = chunk.get("error", {})
                    if self.is_rate_limit_error(0, {"error": error}):
                        raise RateLimitError({"error": error})
                yield chunk
            return
        except RateLimitError:
            logger.warning("Rate limit detected in stream, falling back to LM Studio")
        except Exception as e:
            if "rate" in str(e).lower() or "429" in str(e):
                logger.warning("Rate limit detected in stream, falling back to LM Studio")
            else:
                raise

        # Fallback to LM Studio stream
        self._log_fallback(request_data, "streaming")
        async for chunk in lm_studio_stream_fn:
            yield chunk

    def _log_fallback(self, request_data: Dict[str, Any], status: str):
        """Log fallback events."""
        messages = request_data.get("messages", [])
        content_preview = ""
        if messages:
            content = str(messages[-1].get("content", ""))[:100]
            content_preview = content[:97] + "..." if len(content) > 100 else content

        logger.warning(
            f"Fallback triggered: {status} | "
            f"Content: {content_preview} | "
            f"Timestamp: {datetime.now().isoformat()}"
        )


async def check_lm_studio_available(base_url: str) -> bool:
    """Check if LM Studio is available."""
    try:
        async with aiohttp.ClientSession() as session:
            url = f"{base_url.rstrip('/')}/v1/models"
            async with session.get(url, timeout=aiohttp.ClientTimeout(total=2)) as resp:
                return resp.status == 200
    except Exception:
        return False
