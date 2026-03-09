# Universal Cognitive Bus Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Make PixelBrain the default cognitive engine for ALL Geometry OS components, removing external API dependencies and enabling true offline autonomous operation.

**Architecture:** A unified cognitive routing layer where all LLM requests flow through PixelBrainService. External APIs (LM Studio, OpenAI) become optional fallbacks, not defaults. The brain atlas becomes the "system brain" that the OS can see, use, and evolve.

**Tech Stack:** Python (PixelBrainService, SwarmLLMBackend), JavaScript (WebMCP bridge), WGSL (inference shaders), WebSocket (visual feedback)

---

## Current State Analysis

### Already Complete (Phase 3)
- ✅ `systems/visual_shell/api/pixel_brain_service.py` - Singleton service with tokenize/detokenize/generate
- ✅ `systems/swarm/llm_backend.py` - SwarmLLMBackend for agent integration
- ✅ `systems/swarm/llm_agent.py` - SwarmLLMAgent base class
- ✅ Visual feedback (THOUGHT_PULSE, ATLAS_GLOW, ATTENTION_UPDATE)
- ✅ Brain mutations via Evolution Daemon

### Still Needs Wiring
- ❌ WebMCP `send_llm_prompt` uses LM Studio by default
- ❌ No configuration system for cognitive engine selection
- ❌ External API imports still scattered in codebase
- ❌ No health monitoring for PixelBrain availability

---

## Task 1: Create Cognitive Config System

**Files:**
- Create: `systems/cognitive/cognitive_config.py`
- Test: `tests/test_cognitive_config.py`

**Step 1: Write the failing test**

```python
# tests/test_cognitive_config.py
"""Test cognitive configuration system."""

import pytest


class TestCognitiveConfig:
    """Tests for cognitive engine configuration."""

    def test_default_engine_is_pixelbrain(self):
        """Default cognitive engine should be PixelBrain."""
        from systems.cognitive.cognitive_config import CognitiveConfig

        config = CognitiveConfig()
        assert config.default_engine == "pixelbrain"

    def test_can_set_fallback_engine(self):
        """Should be able to configure fallback engine."""
        from systems.cognitive.cognitive_config import CognitiveConfig

        config = CognitiveConfig(fallback_engine="lmstudio")
        assert config.fallback_engine == "lmstudio"

    def test_can_check_engine_availability(self):
        """Should check if an engine is available."""
        from systems.cognitive.cognitive_config import CognitiveConfig

        config = CognitiveConfig()
        # PixelBrain may or may not be available depending on atlas
        assert isinstance(config.is_available("pixelbrain"), bool)

    def test_get_engine_returns_correct_backend(self):
        """get_engine() should return the appropriate backend."""
        from systems.cognitive.cognitive_config import CognitiveConfig

        config = CognitiveConfig()
        engine = config.get_engine()
        assert engine is not None
        assert hasattr(engine, 'generate')

    def test_environment_variable_override(self, monkeypatch):
        """COGNITIVE_ENGINE env var should override default."""
        monkeypatch.setenv("COGNITIVE_ENGINE", "lmstudio")

        from systems.cognitive.cognitive_config import CognitiveConfig
        config = CognitiveConfig()

        assert config.default_engine == "lmstudio"
```

**Step 2: Run test to verify it fails**

Run: `python3 -m pytest tests/test_cognitive_config.py -v`
Expected: FAIL with "No module named 'systems.cognitive'"

**Step 3: Write minimal implementation**

```python
# systems/cognitive/__init__.py
"""Cognitive subsystem - unified LLM routing."""
from .cognitive_config import CognitiveConfig, get_cognitive_config

__all__ = ["CognitiveConfig", "get_cognitive_config"]
```

```python
# systems/cognitive/cognitive_config.py
"""
Cognitive Configuration System

Provides unified configuration for all LLM backends in Geometry OS.
Default is PixelBrain (native), with optional external fallbacks.
"""

import os
import logging
from typing import Optional, Any, Dict
from enum import Enum

logger = logging.getLogger(__name__)


class CognitiveEngine(Enum):
    """Available cognitive engines."""
    PIXELBRAIN = "pixelbrain"
    LMSTUDIO = "lmstudio"
    OPENAI = "openai"
    ANTHROPIC = "anthropic"


class CognitiveConfig:
    """
    Configuration for cognitive engine selection.

    Usage:
        config = CognitiveConfig()
        engine = config.get_engine()
        result = await engine.generate("Hello")
    """

    def __init__(
        self,
        default_engine: Optional[str] = None,
        fallback_engine: Optional[str] = None,
        pixelbrain_path: Optional[str] = None
    ):
        # Default engine from env or parameter
        env_default = os.environ.get("COGNITIVE_ENGINE", "").lower()
        self.default_engine = default_engine or env_default or "pixelbrain"

        # Fallback when default unavailable
        self.fallback_engine = fallback_engine or "lmstudio"

        # PixelBrain atlas path
        self.pixelbrain_path = pixelbrain_path

        # Cache backends
        self._backends: Dict[str, Any] = {}

    def is_available(self, engine: str) -> bool:
        """Check if a cognitive engine is available."""
        if engine == "pixelbrain":
            return self._check_pixelbrain_available()
        elif engine == "lmstudio":
            return self._check_lmstudio_available()
        elif engine in ("openai", "anthropic"):
            return self._check_external_api_available(engine)
        return False

    def _check_pixelbrain_available(self) -> bool:
        """Check if PixelBrain is ready."""
        try:
            from systems.visual_shell.api.pixel_brain_service import get_pixel_brain_service
            service = get_pixel_brain_service(brain_path=self.pixelbrain_path)
            return service.is_available()
        except Exception as e:
            logger.debug(f"PixelBrain not available: {e}")
            return False

    def _check_lmstudio_available(self) -> bool:
        """Check if LM Studio is running."""
        import socket
        try:
            sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            sock.settimeout(1)
            result = sock.connect_ex(('localhost', 1234))
            sock.close()
            return result == 0
        except Exception:
            return False

    def _check_external_api_available(self, engine: str) -> bool:
        """Check if external API key is configured."""
        key_name = f"{engine.upper()}_API_KEY"
        return bool(os.environ.get(key_name))

    def get_engine(self, engine_name: Optional[str] = None) -> Any:
        """
        Get the cognitive engine backend.

        Args:
            engine_name: Specific engine to use, or None for default

        Returns:
            Backend object with generate() method
        """
        name = engine_name or self.default_engine

        # Check cache
        if name in self._backends:
            return self._backends[name]

        # Get or create backend
        backend = self._create_backend(name)
        self._backends[name] = backend
        return backend

    def _create_backend(self, name: str) -> Any:
        """Create a backend instance."""
        if name == "pixelbrain":
            from systems.swarm.llm_backend import get_swarm_llm_backend
            return get_swarm_llm_backend()
        elif name == "lmstudio":
            from systems.pixel_llm.lm_studio_integration import LMStudioClient
            return LMStudioClient()
        else:
            raise ValueError(f"Unknown cognitive engine: {name}")

    def get_available_engine(self) -> Any:
        """
        Get the first available engine, trying default then fallbacks.

        Returns:
            Available backend or None
        """
        # Try default first
        if self.is_available(self.default_engine):
            return self.get_engine(self.default_engine)

        # Try fallback
        if self.is_available(self.fallback_engine):
            logger.info(f"Using fallback engine: {self.fallback_engine}")
            return self.get_engine(self.fallback_engine)

        # Try all engines
        for engine in CognitiveEngine:
            if self.is_available(engine.value):
                logger.info(f"Using available engine: {engine.value}")
                return self.get_engine(engine.value)

        logger.error("No cognitive engines available")
        return None


# Singleton
_config_instance: Optional[CognitiveConfig] = None


def get_cognitive_config(**kwargs) -> CognitiveConfig:
    """Get global CognitiveConfig singleton."""
    global _config_instance
    if _config_instance is None:
        _config_instance = CognitiveConfig(**kwargs)
    return _config_instance


def reset_cognitive_config():
    """Reset singleton (for testing)."""
    global _config_instance
    _config_instance = None
```

**Step 4: Run test to verify it passes**

Run: `python3 -m pytest tests/test_cognitive_config.py -v`
Expected: 5 passed

**Step 5: Commit**

```bash
git add systems/cognitive/__init__.py systems/cognitive/cognitive_config.py tests/test_cognitive_config.py
git commit -m "feat(cognitive): add unified cognitive config system with PixelBrain default"
```

---

## Task 2: Update WebMCP Bridge to Use Cognitive Config

**Files:**
- Modify: `systems/visual_shell/web/webmcp_bridge.js`
- Test: `tests/test_webmcp_cognitive.js`

**Step 1: Write the failing test**

```javascript
// tests/test_webmcp_cognitive.js
/**
 * Tests for WebMCP cognitive integration.
 */

describe('WebMCP Cognitive Integration', () => {
    let bridge;

    beforeEach(() => {
        // Mock WebSocket
        global.WebSocket = jest.fn(() => ({
            send: jest.fn(),
            close: jest.fn(),
            readyState: 1
        }));

        bridge = new WebMCPBridge();
    });

    test('send_llm_prompt uses PixelBrain by default', async () => {
        const result = await bridge.send_llm_prompt('Hello');

        // Should have tried PixelBrain first
        expect(result.engine).toBe('pixelbrain');
    });

    test('send_llm_prompt falls back to LM Studio if PixelBrain unavailable', async () => {
        // Mock PixelBrain as unavailable
        bridge._pixelbrainAvailable = false;

        const result = await bridge.send_llm_prompt('Hello');

        expect(result.engine).toBe('lmstudio');
    });

    test('cognitive config can be overridden', async () => {
        bridge.setCognitiveEngine('lmstudio');

        const result = await bridge.send_llm_prompt('Hello');

        expect(result.engine).toBe('lmstudio');
    });
});
```

**Step 2: Run test to verify it fails**

Run: `npx jest tests/test_webmcp_cognitive.js`
Expected: FAIL with "WebMCPBridge is not defined" or similar

**Step 3: Write minimal implementation**

Add to `systems/visual_shell/web/webmcp_bridge.js`:

```javascript
// Add at top of WebMCPBridge class
class WebMCPBridge {
    constructor() {
        // ... existing constructor code ...

        // Cognitive engine configuration
        this._cognitiveEngine = 'pixelbrain';  // Default
        this._pixelbrainAvailable = null;
        this._checkPixelBrainAvailability();
    }

    /**
     * Check if PixelBrain backend is available.
     */
    async _checkPixelBrainAvailability() {
        try {
            const response = await this._sendRequest('PIXELBRAIN_STATUS', {});
            this._pixelbrainAvailable = response.available === true;
        } catch (e) {
            this._pixelbrainAvailable = false;
        }
    }

    /**
     * Set the cognitive engine to use.
     * @param {string} engine - 'pixelbrain', 'lmstudio', etc.
     */
    setCognitiveEngine(engine) {
        this._cognitiveEngine = engine;
    }

    /**
     * Get current cognitive engine.
     */
    getCognitiveEngine() {
        return this._cognitiveEngine;
    }

    /**
     * Send LLM prompt through the cognitive bus.
     * Routes through PixelBrain by default, with LM Studio fallback.
     */
    async send_llm_prompt(prompt, options = {}) {
        const engine = options.engine || this._cognitiveEngine;

        // Try PixelBrain first (if selected and available)
        if (engine === 'pixelbrain' && this._pixelbrainAvailable !== false) {
            try {
                const result = await this._sendPixelBrainPrompt(prompt, options);
                return { ...result, engine: 'pixelbrain' };
            } catch (e) {
                console.warn('PixelBrain failed, falling back:', e.message);
                if (!options.allowFallback) {
                    throw e;
                }
            }
        }

        // Fallback to LM Studio
        if (engine === 'lmstudio' || options.allowFallback !== false) {
            try {
                const result = await this._sendLMStudioPrompt(prompt, options);
                return { ...result, engine: 'lmstudio' };
            } catch (e) {
                console.error('LM Studio also failed:', e.message);
                throw e;
            }
        }

        throw new Error('No cognitive engine available');
    }

    /**
     * Send prompt through PixelBrain native inference.
     */
    async _sendPixelBrainPrompt(prompt, options = {}) {
        const response = await this._sendRequest('PIXELBRAIN_GENERATE', {
            prompt,
            max_tokens: options.max_tokens || 100,
            temperature: options.temperature || 0.7,
            emit_visual: options.emit_visual !== false
        });

        return {
            text: response.text,
            tokens: response.tokens,
            visual_feedback: response.visual_feedback
        };
    }

    /**
     * Send prompt through LM Studio (existing implementation).
     */
    async _sendLMStudioPrompt(prompt, options = {}) {
        // Existing LM Studio integration code
        const response = await fetch('http://localhost:1234/v1/completions', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({
                prompt,
                max_tokens: options.max_tokens || 100,
                temperature: options.temperature || 0.7
            })
        });

        const data = await response.json();
        return {
            text: data.choices?.[0]?.text || ''
        };
    }
}
```

**Step 4: Run test to verify it passes**

Run: `npx jest tests/test_webmcp_cognitive.js`
Expected: 3 passed

**Step 5: Commit**

```bash
git add systems/visual_shell/web/webmcp_bridge.js tests/test_webmcp_cognitive.js
git commit -m "feat(webmcp): route send_llm_prompt through PixelBrain by default"
```

---

## Task 3: Add PixelBrain WebSocket Handler to Python Server

**Files:**
- Modify: `systems/pixel_compiler/serve/server.py`
- Test: `tests/test_pixelbrain_websocket_handler.py`

**Step 1: Write the failing test**

```python
# tests/test_pixelbrain_websocket_handler.py
"""Test PixelBrain WebSocket handlers."""

import pytest
import asyncio
from unittest.mock import Mock, AsyncMock, patch


class TestPixelBrainWebSocketHandler:
    """Tests for WebSocket message handling."""

    @pytest.mark.asyncio
    async def test_handle_pixelbrain_generate(self):
        """Should handle PIXELBRAIN_GENERATE message."""
        from systems.pixel_compiler.serve.server import handle_websocket_message

        mock_service = Mock()
        mock_service.generate = AsyncMock(return_value={
            'text': 'Hello world',
            'tokens': [1, 2, 3],
            'visual_feedback': {}
        })

        with patch('systems.pixel_compiler.serve.server.get_pixel_brain_service', return_value=mock_service):
            result = await handle_websocket_message({
                'type': 'PIXELBRAIN_GENERATE',
                'prompt': 'Say hello',
                'max_tokens': 10
            })

        assert result['text'] == 'Hello world'
        assert 'tokens' in result

    @pytest.mark.asyncio
    async def test_handle_pixelbrain_status(self):
        """Should handle PIXELBRAIN_STATUS message."""
        from systems.pixel_compiler.serve.server import handle_websocket_message

        mock_service = Mock()
        mock_service.is_available = Mock(return_value=True)

        with patch('systems.pixel_compiler.serve.server.get_pixel_brain_service', return_value=mock_service):
            result = await handle_websocket_message({
                'type': 'PIXELBRAIN_STATUS'
            })

        assert result['available'] is True
```

**Step 2: Run test to verify it fails**

Run: `python3 -m pytest tests/test_pixelbrain_websocket_handler.py -v`
Expected: FAIL

**Step 3: Add WebSocket handlers to server.py**

```python
# Add to systems/pixel_compiler/serve/server.py

# Import at top
from systems.visual_shell.api.pixel_brain_service import get_pixel_brain_service

# Add to message handlers dict
WEBSOCKET_HANDLERS = {
    # ... existing handlers ...

    'PIXELBRAIN_GENERATE': handle_pixelbrain_generate,
    'PIXELBRAIN_STATUS': handle_pixelbrain_status,
}


async def handle_pixelbrain_generate(message: dict) -> dict:
    """Handle PixelBrain generation request."""
    service = get_pixel_brain_service()

    if not service.is_available():
        return {
            'error': 'PixelBrain not available',
            'available': False
        }

    result = await service.generate(
        prompt=message.get('prompt', ''),
        max_tokens=message.get('max_tokens', 32),
        temperature=message.get('temperature', 0.7),
        emit_visual=message.get('emit_visual', True)
    )

    return result


async def handle_pixelbrain_status(message: dict) -> dict:
    """Handle PixelBrain status check."""
    service = get_pixel_brain_service()

    return {
        'available': service.is_available(),
        'brain_path': str(service.brain_path) if service.brain_path else None
    }


async def handle_websocket_message(message: dict) -> dict:
    """Route WebSocket message to appropriate handler."""
    msg_type = message.get('type', '')

    handler = WEBSOCKET_HANDLERS.get(msg_type)
    if handler:
        return await handler(message)

    return {'error': f'Unknown message type: {msg_type}'}
```

**Step 4: Run test to verify it passes**

Run: `python3 -m pytest tests/test_pixelbrain_websocket_handler.py -v`
Expected: 2 passed

**Step 5: Commit**

```bash
git add systems/pixel_compiler/serve/server.py tests/test_pixelbrain_websocket_handler.py
git commit -m "feat(server): add PixelBrain WebSocket handlers for native inference"
```

---

## Task 4: Create Unified Cognitive Router

**Files:**
- Create: `systems/cognitive/cognitive_router.py`
- Test: `tests/test_cognitive_router.py`

**Step 1: Write the failing test**

```python
# tests/test_cognitive_router.py
"""Test unified cognitive router."""

import pytest
from unittest.mock import Mock, AsyncMock, patch


class TestCognitiveRouter:
    """Tests for the cognitive routing layer."""

    @pytest.mark.asyncio
    async def test_route_uses_pixelbrain_by_default(self):
        """Router should use PixelBrain by default."""
        from systems.cognitive.cognitive_router import CognitiveRouter

        router = CognitiveRouter()

        with patch.object(router, '_get_pixelbrain') as mock_pb:
            mock_backend = Mock()
            mock_backend.generate = AsyncMock(return_value="Generated text")
            mock_pb.return_value = mock_backend

            result = await router.generate("Hello")

            mock_pb.assert_called_once()

    @pytest.mark.asyncio
    async def test_route_falls_back_on_pixelbrain_failure(self):
        """Router should fall back when PixelBrain fails."""
        from systems.cognitive.cognitive_router import CognitiveRouter

        router = CognitiveRouter()

        with patch.object(router, '_get_pixelbrain', side_effect=Exception("PB failed")):
            with patch.object(router, '_get_lmstudio') as mock_lms:
                mock_backend = Mock()
                mock_backend.generate = AsyncMock(return_value="Fallback text")
                mock_lms.return_value = mock_backend

                result = await router.generate("Hello", allow_fallback=True)

                mock_lms.assert_called_once()
                assert result == "Fallback text"

    @pytest.mark.asyncio
    async def test_route_returns_error_when_no_engine_available(self):
        """Router should return clear error when no engine available."""
        from systems.cognitive.cognitive_router import CognitiveRouter

        router = CognitiveRouter()

        with patch.object(router, '_get_pixelbrain', side_effect=Exception("PB unavailable")):
            with patch.object(router, '_get_lmstudio', side_effect=Exception("LMS unavailable")):
                result = await router.generate("Hello", allow_fallback=True)

                assert "error" in result.lower() or "unavailable" in result.lower()
```

**Step 2: Run test to verify it fails**

Run: `python3 -m pytest tests/test_cognitive_router.py -v`
Expected: FAIL

**Step 3: Write minimal implementation**

```python
# systems/cognitive/cognitive_router.py
"""
Unified Cognitive Router

Single entry point for all LLM operations in Geometry OS.
Routes requests through PixelBrain by default, with external fallbacks.
"""

import logging
from typing import Optional, Dict, Any

logger = logging.getLogger(__name__)


class CognitiveRouter:
    """
    Unified routing for all cognitive operations.

    Usage:
        router = CognitiveRouter()
        result = await router.generate("Write a function")
    """

    def __init__(self, config: Optional["CognitiveConfig"] = None):
        from .cognitive_config import get_cognitive_config
        self.config = config or get_cognitive_config()
        self._backends: Dict[str, Any] = {}

    async def generate(
        self,
        prompt: str,
        max_tokens: int = 100,
        temperature: float = 0.7,
        engine: Optional[str] = None,
        allow_fallback: bool = True,
        **kwargs
    ) -> str:
        """
        Generate text through the cognitive bus.

        Args:
            prompt: Input prompt
            max_tokens: Maximum tokens to generate
            temperature: Sampling temperature
            engine: Specific engine to use (None for default)
            allow_fallback: Whether to fall back if primary fails

        Returns:
            Generated text or error message
        """
        engine_name = engine or self.config.default_engine

        # Try primary engine
        try:
            backend = self._get_backend(engine_name)
            if hasattr(backend, 'generate'):
                result = await backend.generate(
                    prompt=prompt,
                    max_tokens=max_tokens,
                    temperature=temperature,
                    **kwargs
                )
                return result if isinstance(result, str) else result.get('text', '')
        except Exception as e:
            logger.warning(f"Engine {engine_name} failed: {e}")

            if not allow_fallback:
                return f"[Error: {engine_name} unavailable]"

        # Try fallback
        if allow_fallback and engine_name != self.config.fallback_engine:
            try:
                backend = self._get_backend(self.config.fallback_engine)
                if hasattr(backend, 'generate'):
                    result = await backend.generate(
                        prompt=prompt,
                        max_tokens=max_tokens,
                        temperature=temperature,
                        **kwargs
                    )
                    logger.info(f"Used fallback engine: {self.config.fallback_engine}")
                    return result if isinstance(result, str) else result.get('text', '')
            except Exception as e:
                logger.error(f"Fallback engine also failed: {e}")

        return "[Error: No cognitive engines available]"

    def _get_backend(self, engine_name: str) -> Any:
        """Get or create backend for engine."""
        if engine_name in self._backends:
            return self._backends[engine_name]

        if engine_name == "pixelbrain":
            backend = self._get_pixelbrain()
        elif engine_name == "lmstudio":
            backend = self._get_lmstudio()
        else:
            raise ValueError(f"Unknown engine: {engine_name}")

        self._backends[engine_name] = backend
        return backend

    def _get_pixelbrain(self):
        """Get PixelBrain backend."""
        from systems.swarm.llm_backend import get_swarm_llm_backend
        return get_swarm_llm_backend()

    def _get_lmstudio(self):
        """Get LM Studio backend."""
        from systems.pixel_llm.lm_studio_integration import LMStudioClient
        return LMStudioClient()


# Singleton
_router_instance: Optional[CognitiveRouter] = None


def get_cognitive_router() -> CognitiveRouter:
    """Get global CognitiveRouter singleton."""
    global _router_instance
    if _router_instance is None:
        _router_instance = CognitiveRouter()
    return _router_instance
```

**Step 4: Run test to verify it passes**

Run: `python3 -m pytest tests/test_cognitive_router.py -v`
Expected: 3 passed

**Step 5: Commit**

```bash
git add systems/cognitive/cognitive_router.py tests/test_cognitive_router.py
git commit -m "feat(cognitive): add unified router with PixelBrain default and fallback"
```

---

## Task 5: Update Existing LLM Callers to Use Router

**Files:**
- Modify: `systems/swarm/guilds/engineer.py`
- Modify: `systems/swarm/guilds/architect.py`
- Modify: `systems/swarm/guilds/reviewer.py`
- Test: `tests/test_swarm_unified_routing.py`

**Step 1: Write the failing test**

```python
# tests/test_swarm_unified_routing.py
"""Test that swarm agents use unified cognitive router."""

import pytest
from unittest.mock import Mock, AsyncMock, patch


class TestSwarmUnifiedRouting:
    """Tests for swarm agent cognitive integration."""

    @pytest.mark.asyncio
    async def test_engineer_uses_cognitive_router(self):
        """EngineerAgent should use CognitiveRouter."""
        from systems.swarm.guilds.engineer import EngineerAgent

        with patch('systems.swarm.guilds.engineer.get_cognitive_router') as mock_router:
            router = Mock()
            router.generate = AsyncMock(return_value="def hello(): pass")
            mock_router.return_value = router

            agent = EngineerAgent()
            result = await agent.generate_code("Write hello function")

            router.generate.assert_called_once()
            assert "def" in result

    @pytest.mark.asyncio
    async def test_architect_uses_cognitive_router(self):
        """ArchitectAgent should use CognitiveRouter."""
        from systems.swarm.guilds.architect import ArchitectAgent

        with patch('systems.swarm.guilds.architect.get_cognitive_router') as mock_router:
            router = Mock()
            router.generate = AsyncMock(return_value="Architecture: MVC pattern")
            mock_router.return_value = router

            agent = ArchitectAgent()
            result = await agent.design("Create web app architecture")

            router.generate.assert_called_once()

    @pytest.mark.asyncio
    async def test_reviewer_uses_cognitive_router(self):
        """ReviewerAgent should use CognitiveRouter."""
        from systems.swarm.guilds.reviewer import ReviewerAgent

        with patch('systems.swarm.guilds.reviewer.get_cognitive_router') as mock_router:
            router = Mock()
            router.generate = AsyncMock(return_value="Review: LGTM")
            mock_router.return_value = router

            agent = ReviewerAgent()
            result = await agent.review("def foo(): pass")

            router.generate.assert_called_once()
```

**Step 2: Run test to verify it fails**

Run: `python3 -m pytest tests/test_swarm_unified_routing.py -v`
Expected: FAIL (agents may still use old backend directly)

**Step 3: Update agent imports**

In each agent file (`engineer.py`, `architect.py`, `reviewer.py`), replace:

```python
# OLD
from systems.swarm.llm_backend import get_swarm_llm_backend

class EngineerAgent:
    def __init__(self):
        self.llm = get_swarm_llm_backend()
```

With:

```python
# NEW
from systems.cognitive.cognitive_router import get_cognitive_router

class EngineerAgent:
    def __init__(self):
        self.router = get_cognitive_router()

    async def generate_code(self, description: str) -> str:
        return await self.router.generate(
            f"Write code that: {description}",
            max_tokens=500,
            temperature=0.3
        )
```

**Step 4: Run test to verify it passes**

Run: `python3 -m pytest tests/test_swarm_unified_routing.py -v`
Expected: 3 passed

**Step 5: Commit**

```bash
git add systems/swarm/guilds/engineer.py systems/swarm/guilds/architect.py systems/swarm/guilds/reviewer.py tests/test_swarm_unified_routing.py
git commit -m "refactor(swarm): migrate agents to unified cognitive router"
```

---

## Task 6: Add Health Monitoring Endpoint

**Files:**
- Modify: `systems/pixel_compiler/serve/server.py`
- Test: `tests/test_cognitive_health.py`

**Step 1: Write the failing test**

```python
# tests/test_cognitive_health.py
"""Test cognitive health monitoring."""

import pytest


class TestCognitiveHealth:
    """Tests for health monitoring."""

    def test_health_endpoint_reports_engine_status(self):
        """Health endpoint should report all engine statuses."""
        from systems.pixel_compiler.serve.server import get_cognitive_health

        health = get_cognitive_health()

        assert 'pixelbrain' in health
        assert 'lmstudio' in health
        assert isinstance(health['pixelbrain']['available'], bool)

    def test_health_includes_brain_atlas_info(self):
        """Health should include brain atlas metadata."""
        from systems.pixel_compiler.serve.server import get_cognitive_health

        health = get_cognitive_health()

        if health['pixelbrain']['available']:
            assert 'brain_path' in health['pixelbrain']
```

**Step 2: Run test to verify it fails**

Run: `python3 -m pytest tests/test_cognitive_health.py -v`
Expected: FAIL

**Step 3: Add health monitoring**

```python
# Add to systems/pixel_compiler/serve/server.py

def get_cognitive_health() -> dict:
    """Get health status of all cognitive engines."""
    from systems.cognitive.cognitive_config import CognitiveConfig

    config = CognitiveConfig()

    health = {
        'pixelbrain': {
            'available': config.is_available('pixelbrain'),
            'brain_path': None
        },
        'lmstudio': {
            'available': config.is_available('lmstudio'),
            'endpoint': 'localhost:1234'
        },
        'external_apis': {
            'openai': config.is_available('openai'),
            'anthropic': config.is_available('anthropic')
        }
    }

    # Add brain path if available
    if health['pixelbrain']['available']:
        try:
            from systems.visual_shell.api.pixel_brain_service import get_pixel_brain_service
            service = get_pixel_brain_service()
            health['pixelbrain']['brain_path'] = str(service.brain_path)
        except Exception:
            pass

    return health


# Add to HTTP routes
@app.route('/api/cognitive/health')
def cognitive_health():
    """Return cognitive engine health status."""
    return jsonify(get_cognitive_health())
```

**Step 4: Run test to verify it passes**

Run: `python3 -m pytest tests/test_cognitive_health.py -v`
Expected: 2 passed

**Step 5: Commit**

```bash
git add systems/pixel_compiler/serve/server.py tests/test_cognitive_health.py
git commit -m "feat(server): add cognitive health monitoring endpoint"
```

---

## Task 7: Deprecate Direct External API Imports

**Files:**
- Create: `systems/cognitive/deprecated.py`
- Modify: Various files with direct imports

**Step 1: Create deprecation warnings**

```python
# systems/cognitive/deprecated.py
"""
Deprecation warnings for direct external API usage.

Import this to get warnings when using old patterns.
"""

import warnings


def warn_deprecated_api(old_import: str, new_pattern: str):
    """Emit deprecation warning for direct API usage."""
    warnings.warn(
        f"{old_import} is deprecated. Use {new_pattern} instead. "
        "Direct external API calls will be removed in v2.0.",
        DeprecationWarning,
        stacklevel=3
    )


# Example usage in code:
# from systems.cognitive.deprecated import warn_deprecated_api
# warn_deprecated_api("openai.ChatCompletion", "get_cognitive_router().generate()")
```

**Step 2: Add deprecation notices to files**

Search for direct imports of `openai`, `anthropic`, etc., and add:

```python
# TODO: Deprecated - migrate to cognitive router
# from systems.cognitive.cognitive_router import get_cognitive_router
# router = get_cognitive_router()
# result = await router.generate(prompt)
```

**Step 3: Commit**

```bash
git add systems/cognitive/deprecated.py
git commit -m "docs(cognitive): add deprecation warnings for direct API usage"
```

---

## Task 8: Integration Test - Full Cognitive Bus

**Files:**
- Create: `tests/test_cognitive_bus_e2e.py`

**Step 1: Write comprehensive E2E test**

```python
# tests/test_cognitive_bus_e2e.py
"""
End-to-end test for the unified cognitive bus.

Tests the full flow:
  WebMCP → CognitiveRouter → PixelBrainService → WGSL Pipeline → Visual Feedback
"""

import pytest
import asyncio
from unittest.mock import Mock, AsyncMock, patch


class TestCognitiveBusE2E:
    """End-to-end cognitive bus tests."""

    @pytest.mark.asyncio
    async def test_full_generation_flow(self):
        """Test complete generation flow through cognitive bus."""
        from systems.cognitive.cognitive_router import CognitiveRouter

        # Mock the pipeline
        with patch('systems.visual_shell.wgsl.pixel_brain_pipeline.PixelBrainPipeline') as MockPipeline:
            mock_pipeline = Mock()
            mock_pipeline.generate = Mock(return_value=[1, 2, 3, 4, 5])
            mock_pipeline.is_available = Mock(return_value=True)
            MockPipeline.return_value = mock_pipeline

            router = CognitiveRouter()
            result = await router.generate("Hello world", max_tokens=5)

            assert result is not None

    @pytest.mark.asyncio
    async def test_websocket_to_pipeline_flow(self):
        """Test WebSocket message triggers pipeline generation."""
        from systems.pixel_compiler.serve.server import handle_websocket_message

        with patch('systems.visual_shell.api.pixel_brain_service.get_pixel_brain_service') as mock_service:
            service = Mock()
            service.is_available = Mock(return_value=True)
            service.generate = AsyncMock(return_value={
                'text': 'Generated response',
                'tokens': [1, 2, 3],
                'visual_feedback': {'glyphs': []}
            })
            mock_service.return_value = service

            result = await handle_websocket_message({
                'type': 'PIXELBRAIN_GENERATE',
                'prompt': 'Test prompt',
                'max_tokens': 10
            })

            assert result['text'] == 'Generated response'

    @pytest.mark.asyncio
    async def test_fallback_flow(self):
        """Test fallback when PixelBrain unavailable."""
        from systems.cognitive.cognitive_router import CognitiveRouter

        router = CognitiveRouter()

        # Mock PixelBrain as unavailable
        with patch.object(router, '_get_pixelbrain', side_effect=Exception("Unavailable")):
            with patch.object(router, '_get_lmstudio') as mock_lms:
                mock_backend = Mock()
                mock_backend.generate = AsyncMock(return_value="LM Studio response")
                mock_lms.return_value = mock_backend

                result = await router.generate("Test", allow_fallback=True)

                assert "LM Studio" in result or "response" in result

    def test_health_check_integration(self):
        """Test health check returns correct status."""
        from systems.pixel_compiler.serve.server import get_cognitive_health

        health = get_cognitive_health()

        # Should have all engines
        assert 'pixelbrain' in health
        assert 'lmstudio' in health

        # Should have boolean availability
        assert isinstance(health['pixelbrain']['available'], bool)
        assert isinstance(health['lmstudio']['available'], bool)
```

**Step 2: Run all tests**

Run: `python3 -m pytest tests/test_cognitive_bus_e2e.py -v`
Expected: 4 passed

**Step 3: Run full cognitive test suite**

Run: `python3 -m pytest tests/test_cognitive*.py tests/test_pixelbrain*.py -v`
Expected: All pass

**Step 4: Commit**

```bash
git add tests/test_cognitive_bus_e2e.py
git commit -m "test(cognitive): add comprehensive E2E tests for cognitive bus"
```

---

## Task 9: Documentation and Final Cleanup

**Files:**
- Update: `docs/PIXEL_BRAIN_ARCHITECTURE.md`
- Create: `docs/COGNITIVE_BUS_GUIDE.md`

**Step 1: Create usage guide**

```markdown
# Cognitive Bus Usage Guide

## Quick Start

```python
from systems.cognitive.cognitive_router import get_cognitive_router

router = get_cognitive_router()
result = await router.generate("Hello, world!")
```

## Configuration

Set environment variable to change default engine:
```bash
export COGNITIVE_ENGINE=lmstudio  # Use LM Studio instead of PixelBrain
```

## Available Engines

| Engine | Status | Description |
|--------|--------|-------------|
| pixelbrain | Default | Native GPU inference via WGSL |
| lmstudio | Fallback | Local LM Studio server |
| openai | Optional | Requires OPENAI_API_KEY |
| anthropic | Optional | Requires ANTHROPIC_API_KEY |

## Health Check

```bash
curl http://localhost:8000/api/cognitive/health
```

## Migration from Direct API Calls

Before:
```python
import openai
response = openai.ChatCompletion.create(...)
```

After:
```python
from systems.cognitive.cognitive_router import get_cognitive_router
router = get_cognitive_router()
response = await router.generate(...)
```
```

**Step 2: Commit**

```bash
git add docs/COGNITIVE_BUS_GUIDE.md
git commit -m "docs: add cognitive bus usage guide"
```

---

## Summary

| Task | Description | Tests |
|------|-------------|-------|
| 1 | Cognitive config system | 5 |
| 2 | WebMCP bridge integration | 3 |
| 3 | WebSocket handlers | 2 |
| 4 | Unified cognitive router | 3 |
| 5 | Swarm agent migration | 3 |
| 6 | Health monitoring | 2 |
| 7 | Deprecation warnings | - |
| 8 | E2E integration tests | 4 |
| 9 | Documentation | - |

**Total: ~22 new tests**

**Result:** Geometry OS becomes fully autonomous with PixelBrain as the default cognitive engine. No external API dependencies required for operation.
