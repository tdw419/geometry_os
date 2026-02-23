"""FastAPI server for the Hybrid LLM Proxy."""
import logging
import os
import sys
from typing import Dict, Any, Optional

import aiohttp
from fastapi import FastAPI, HTTPException, Request, BackgroundTasks
from fastapi.responses import StreamingResponse, JSONResponse
from pydantic import BaseModel

from .config import config
from .translator import AnthropicToOpenAI, OpenAIToAnthropic
from .router import RequestRouter
from .fallback import FallbackHandler, RateLimitError, check_lm_studio_available

# Setup logging
logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s - %(name)s - %(levelname)s - %(message)s"
)
logger = logging.getLogger(__name__)


class Message(BaseModel):
    """Message model."""
    role: str
    content: str


class AnthropicRequest(BaseModel):
    """Anthropic-compatible request model."""
    model: str
    max_tokens: int = 4096
    messages: list[Message]
    system: Optional[str] = None
    temperature: Optional[float] = 0.7
    top_p: Optional[float] = None
    stop_sequences: Optional[list[str]] = None
    stream: Optional[bool] = False


def create_app() -> FastAPI:
    """Create and configure the FastAPI application."""
    app = FastAPI(
        title="Hybrid LLM Proxy",
        description="Routes requests between Claude API and LM Studio",
        version="1.0.0",
    )

    # Initialize components
    router = RequestRouter(config)
    fallback_handler = FallbackHandler(config)

    # Track LM Studio availability
    lm_studio_available = False

    @app.on_event("startup")
    async def startup():
        """Check LM Studio availability on startup."""
        nonlocal lm_studio_available
        lm_studio_available = await check_lm_studio_available(config.lm_studio_base_url)
        if lm_studio_available:
            logger.info(f"LM Studio available at {config.lm_studio_base_url}")
        else:
            logger.warning(f"LM Studio not available at {config.lm_studio_base_url}")

    @app.get("/health")
    async def health_check():
        """Health check endpoint."""
        return {
            "status": "healthy",
            "lm_studio_available": lm_studio_available,
            "claude_configured": bool(config.claude_api_key),
        }

    @app.get("/v1/models")
    async def list_models():
        """List available models (merged from Claude and LM Studio)."""
        models = []

        # Add Claude models if configured
        if config.claude_api_key:
            models.extend([
                {"id": "claude-3-5-sonnet-20241022", "object": "model", "owned_by": "anthropic"},
                {"id": "claude-3-5-haiku-20241022", "object": "model", "owned_by": "anthropic"},
            ])

        # Add LM Studio models if available
        if lm_studio_available:
            try:
                async with aiohttp.ClientSession() as session:
                    url = f"{config.lm_studio_base_url}/v1/models"
                    async with session.get(url, timeout=aiohttp.ClientTimeout(total=5)) as resp:
                        if resp.status == 200:
                            data = await resp.json()
                            for model in data.get("data", []):
                                model["owned_by"] = "lm_studio"
                                models.append(model)
            except Exception as e:
                logger.warning(f"Failed to fetch LM Studio models: {e}")

        return {"object": "list", "data": models}

    @app.post("/v1/messages")
    async def create_message(request: Request):
        """
        Main endpoint for Anthropic-compatible message creation.

        Accepts Anthropic format, routes to Claude or LM Studio,
        returns Anthropic format response.
        """
        body = await request.json()
        anthropic_request = AnthropicRequest(**body)

        # Route the request
        routing_decision = await router.route(body)
        backend = routing_decision["backend"]

        logger.info(f"Routing to {backend} (task: {routing_decision['task_type']})")

        if backend == "lm_studio" or not config.claude_api_key:
            # Route to LM Studio
            return await _handle_lm_studio_request(body, anthropic_request)
        else:
            # Route to Claude API with fallback
            return await _handle_claude_request_with_fallback(body, anthropic_request)

    async def _handle_lm_studio_request(body: Dict[str, Any], request: AnthropicRequest):
        """Handle request routed to LM Studio."""
        try:
            # Translate to OpenAI format
            openai_request = AnthropicToOpenAI.translate_request(body)

            async with aiohttp.ClientSession() as session:
                url = f"{config.lm_studio_base_url}/v1/chat/completions"
                async with session.post(url, json=openai_request, timeout=aiohttp.ClientTimeout(total=120)) as resp:
                    if resp.status != 200:
                        error_text = await resp.text()
                        logger.error(f"LM Studio error: {resp.status} - {error_text}")
                        raise HTTPException(status_code=resp.status, detail=f"LM Studio error: {error_text}")

                    openai_response = await resp.json()

            # Translate response back to Anthropic format
            anthropic_response = AnthropicToOpenAI.translate_response(openai_response)
            return anthropic_response

        except aiohttp.ClientError as e:
            logger.error(f"LM Studio connection error: {e}")
            raise HTTPException(status_code=503, detail=f"LM Studio unavailable: {e}")

    async def _handle_claude_request_with_fallback(body: Dict[str, Any], request: AnthropicRequest):
        """Handle request to Claude API with fallback to LM Studio."""
        async def call_claude():
            """Make request to Cloud API (Anthropic or OpenAI-compatible)."""
            if not config.claude_api_key:
                raise HTTPException(status_code=401, detail="Cloud API key not configured")

            # Check if using OpenAI-compatible API (like Z.ai)
            if config.cloud_api_type == "openai":
                # Translate to OpenAI format
                openai_request = AnthropicToOpenAI.translate_request(body)
                headers = {
                    "Authorization": f"Bearer {config.claude_api_key}",
                    "Content-Type": "application/json",
                }
                # Append /chat/completions to base URL
                base_url = config.claude_api_url.rstrip("/")
                if not base_url.endswith("/chat/completions"):
                    url = f"{base_url}/chat/completions"
                else:
                    url = base_url
                request_body = openai_request
            else:
                # Use Anthropic format
                headers = {
                    "x-api-key": config.claude_api_key,
                    "anthropic-version": "2023-06-01",
                    "Content-Type": "application/json",
                }
                headers["anthropic-dangerous-direct-browser-access"] = "false"
                url = config.claude_api_url
                request_body = body

            async with aiohttp.ClientSession() as session:
                async with session.post(url, headers=headers, json=request_body, timeout=aiohttp.ClientTimeout(total=120)) as resp:
                    # Always try to read JSON response (content_length may be None for chunked)
                    try:
                        response_data = await resp.json()
                    except:
                        response_data = {}

                    logger.info(f"Cloud API response status: {resp.status}")
                    logger.info(f"Cloud API response keys: {list(response_data.keys())}")

                    if fallback_handler.is_rate_limit_error(resp.status, response_data):
                        raise RateLimitError(response_data)

                    if resp.status != 200:
                        error_detail = response_data.get("error", {}).get("message", f"HTTP {resp.status}")
                        logger.error(f"Cloud API error: {resp.status} - {error_detail}")
                        raise HTTPException(status_code=resp.status, detail=error_detail)

                    # Translate response if OpenAI-compatible
                    if config.cloud_api_type == "openai":
                        return AnthropicToOpenAI.translate_response(response_data)
                    return response_data

        async def call_lm_studio():
            """Fallback to LM Studio."""
            openai_request = AnthropicToOpenAI.translate_request(body)

            async with aiohttp.ClientSession() as session:
                url = f"{config.lm_studio_base_url}/v1/chat/completions"
                async with session.post(url, json=openai_request, timeout=aiohttp.ClientTimeout(total=120)) as resp:
                    if resp.status != 200:
                        error_text = await resp.text()
                        raise HTTPException(status_code=resp.status, detail=f"LM Studio error: {error_text}")

                    openai_response = await resp.json()
                    return AnthropicToOpenAI.translate_response(openai_response)

        # Execute with fallback
        try:
            return await fallback_handler.execute_with_fallback(
                call_claude, call_lm_studio, body
            )
        except RateLimitError:
            # Fallback already attempted
            raise HTTPException(status_code=529, detail="Both Claude and LM Studio unavailable")
        except HTTPException:
            raise
        except Exception as e:
            logger.error(f"Unexpected error: {e}")
            raise HTTPException(status_code=500, detail=str(e))

    @app.exception_handler(Exception)
    async def global_exception_handler(request: Request, exc: Exception):
        """Global exception handler."""
        logger.error(f"Unhandled exception: {exc}")
        return JSONResponse(
            status_code=500,
            content={"error": {"message": str(exc), "type": "internal_error"}}
        )

    return app


# Create app instance
app = create_app()


def main():
    """Run the server directly."""
    import uvicorn

    host = config.host
    port = config.port

    logger.info(f"Starting Hybrid LLM Proxy on {host}:{port}")
    logger.info(f"LM Studio URL: {config.lm_studio_base_url}")
    logger.info(f"Claude API configured: {bool(config.claude_api_key)}")
    logger.info(f"Fallback enabled: {config.enable_fallback}")

    uvicorn.run(
        "hybrid_proxy.server:app",
        host=host,
        port=port,
        reload=False,
        access_log=True,
    )


if __name__ == "__main__":
    main()
