"""Configuration for the Hybrid LLM Proxy."""
import os
from dataclasses import dataclass
from typing import Optional


@dataclass
class HybridProxyConfig:
    """Configuration for the hybrid LLM proxy server."""

    # Server settings
    host: str = os.getenv("HYBRID_PROXY_HOST", "0.0.0.0")
    port: int = int(os.getenv("HYBRID_PROXY_PORT", "4000"))

    # Cloud API settings (supports Anthropic or OpenAI-compatible APIs like Z.ai)
    claude_api_key: Optional[str] = os.getenv("ANTHROPIC_API_KEY") or os.getenv("ZAI_API_KEY")
    claude_api_url: str = os.getenv(
        "ANTHROPIC_API_URL",
        "https://api.anthropic.com/v1/messages"
    )
    # Set to "openai" for OpenAI-compatible APIs (Z.ai, etc.)
    cloud_api_type: str = os.getenv("CLOUD_API_TYPE", "anthropic")  # "anthropic" or "openai"

    # LM Studio settings
    lm_studio_base_url: str = os.getenv(
        "LM_STUDIO_BASE_URL",
        "http://localhost:1234"
    ).rstrip("/")

    # Routing settings
    enable_fallback: bool = os.getenv("HYBRID_PROXY_ENABLE_FALLBACK", "true").lower() == "true"
    log_routing: bool = os.getenv("HYBRID_PROXY_LOG_ROUTING", "true").lower() == "true"

    # Task classification keywords
    background_keywords: list = None
    default_keywords: list = None
    think_keywords: list = None

    def __post_init__(self):
        """Initialize default keyword lists."""
        if self.background_keywords is None:
            self.background_keywords = [
                "file read", "read file", "glob", "search", "find file",
                "list files", "directory", "filesystem", "grep",
                "content search", "file contents"
            ]
        if self.default_keywords is None:
            self.default_keywords = [
                "explain", "describe", "summarize", "what is",
                "how to", "help me", "debug", "fix", "error"
            ]
        if self.think_keywords is None:
            self.think_keywords = [
                "analyze", "design", "architect", "plan", "strategy",
                "refactor", "optimize", "complex", "reasoning"
            ]

    @classmethod
    def from_env(cls) -> "HybridProxyConfig":
        """Create configuration from environment variables."""
        return cls()


# Global configuration instance
config = HybridProxyConfig.from_env()
