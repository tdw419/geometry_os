# PixelBrain Cognitive Core Integration Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Make PixelBrain the universal cognitive engine of Geometry OS, replacing all external LLM dependencies with native, visible, GPU-accelerated inference.

**Architecture:** Four-phase integration - (1) Universal Cognitive Bus via WebMCP, (2) Autonomous Swarm Migration, (3) Glass Box Dashboard, (4) Recursive Evolution. The LLM becomes a first-class spatial citizen, not a black box API.

**Tech Stack:** Python (PixelBrainPipeline), JavaScript (WebMCP Bridge), WGSL (GPU shaders), WebSocket (visual sync)

---

## Phase 1: Universal Cognitive Bus

**Goal:** Replace `send_llm_prompt` external API calls with native PixelBrain inference.

### Task 1.1: Create PixelBrain Service Module

**Files:**
- Create: `systems/visual_shell/api/pixel_brain_service.py`
- Test: `tests/test_pixel_brain_service.py`

**Step 1: Write the failing test**

Create `tests/test_pixel_brain_service.py`:

```python
"""Tests for PixelBrain as universal cognitive service."""
import pytest
import asyncio
from unittest.mock import MagicMock, AsyncMock, patch


class TestPixelBrainService:
    """Test the universal cognitive bus integration."""

    @pytest.fixture
    def service(self):
        """Create a PixelBrainService instance."""
        from systems.visual_shell.api.pixel_brain_service import PixelBrainService
        return PixelBrainService()

    def test_service_initializes_pipeline(self, service):
        """Service should initialize PixelBrainPipeline on creation."""
        assert service.pipeline is not None

    def test_service_has_tokenize_method(self, service):
        """Service should have tokenize() method."""
        assert hasattr(service, 'tokenize')
        tokens = service.tokenize("Hello world")
        assert isinstance(tokens, list)
        assert len(tokens) == 2

    def test_service_has_detokenize_method(self, service):
        """Service should have detokenize() method."""
        assert hasattr(service, 'detokenize')
        text = service.detokenize([15496, 995])
        assert isinstance(text, str)

    @pytest.mark.asyncio
    async def test_service_generate_returns_tokens(self, service):
        """generate() should return list of tokens."""
        result = await service.generate("Once upon", max_tokens=5)
        assert isinstance(result, dict)
        assert 'tokens' in result
        assert len(result['tokens']) == 5

    @pytest.mark.asyncio
    async def test_service_generate_includes_visual_data(self, service):
        """generate() should include visual feedback data."""
        result = await service.generate("test", max_tokens=3)
        assert 'visual_feedback' in result
        assert 'accessed_indices' in result['visual_feedback']
        assert 'glyphs' in result['visual_feedback']
```

**Step 2: Run test to verify it fails**

```bash
pytest tests/test_pixel_brain_service.py -v
```

Expected: FAIL - module not found

**Step 3: Create PixelBrainService**

Create `systems/visual_shell/api/pixel_brain_service.py`:

```python
"""
PixelBrain Universal Cognitive Service

Exposes PixelBrainPipeline as a unified service for all Geometry OS components.
Every LLM request in the OS routes through this service, ensuring:
- Offline-first operation (no external APIs)
- Visual feedback (watch the model think)
- Spatial locality (Hilbert-mapped weights)
- GPU acceleration (WGSL shaders)

Usage:
    service = PixelBrainService()
    result = await service.generate("Write a function", max_tokens=100)
    print(result['text'])
    # Visual feedback automatically emitted to VisualBridge
"""

import asyncio
import logging
from typing import Optional, List, Dict, Any
from pathlib import Path

logger = logging.getLogger(__name__)


class PixelBrainService:
    """
    Universal cognitive service backed by PixelBrain GPU inference.

    This is the single entry point for all LLM operations in Geometry OS.
    Replaces external API calls (LM Studio, OpenAI, Anthropic) with
    native, visible, spatial inference.
    """

    _instance = None  # Singleton

    def __new__(cls, *args, **kwargs):
        if cls._instance is None:
            cls._instance = super().__new__(cls)
            cls._instance._initialized = False
        return cls._instance

    def __init__(
        self,
        brain_path: str = "tinystories_brain.rts.png",
        auto_start: bool = True
    ):
        if self._initialized:
            return

        self.brain_path = brain_path
        self.pipeline = None
        self._visual_bridge = None
        self._initialized = False
        self._tokenizer = None

        if auto_start:
            self._initialize()

    def _initialize(self):
        """Initialize the PixelBrain pipeline."""
        try:
            from systems.visual_shell.wgsl.pixel_brain_pipeline import PixelBrainPipeline
            self.pipeline = PixelBrainPipeline(self.brain_path)
            logger.info(f"PixelBrainService initialized with {self.brain_path}")

            # Try to load tokenizer
            try:
                from transformers import AutoTokenizer
                self._tokenizer = AutoTokenizer.from_pretrained("roneneldan/TinyStories-1M")
            except Exception as e:
                logger.warning(f"Tokenizer not available: {e}")

            self._initialized = True
        except FileNotFoundError:
            logger.warning(f"Brain atlas not found at {self.brain_path}")
            self.pipeline = None
        except Exception as e:
            logger.error(f"Failed to initialize PixelBrain: {e}")
            self.pipeline = None

    def _get_visual_bridge(self):
        """Get or create visual bridge connection."""
        if self._visual_bridge is None:
            try:
                from systems.visual_shell.api.visual_bridge import multi_vm_streamer
                self._visual_bridge = multi_vm_streamer
            except Exception as e:
                logger.warning(f"Visual bridge not available: {e}")
        return self._visual_bridge

    def tokenize(self, text: str) -> List[int]:
        """
        Convert text to token IDs.

        Args:
            text: Input text string

        Returns:
            List of token IDs
        """
        if self._tokenizer:
            return self._tokenizer.encode(text)
        # Fallback: simple whitespace tokenization
        return [hash(word) % 32000 for word in text.split()]

    def detokenize(self, tokens: List[int]) -> str:
        """
        Convert token IDs back to text.

        Args:
            tokens: List of token IDs

        Returns:
            Decoded text string
        """
        if self._tokenizer:
            return self._tokenizer.decode(tokens)
        # Fallback: return token count
        return f"[{len(tokens)} tokens]"

    async def generate(
        self,
        prompt: str,
        max_tokens: int = 50,
        temperature: float = 0.7,
        emit_visual: bool = True
    ) -> Dict[str, Any]:
        """
        Generate text from prompt using PixelBrain GPU inference.

        Args:
            prompt: Input prompt text
            max_tokens: Maximum tokens to generate
            temperature: Sampling temperature (0.0-1.0)
            emit_visual: Whether to emit visual feedback

        Returns:
            {
                'text': str,              # Generated text
                'tokens': List[int],      # Raw token IDs
                'visual_feedback': {      # Visual data
                    'accessed_indices': List[int],
                    'glyphs': List[dict]
                },
                'latency_ms': float       # Generation time
            }
        """
        import time

        if not self.pipeline:
            return {
                'text': '[PixelBrain not available]',
                'tokens': [],
                'visual_feedback': {'accessed_indices': [], 'glyphs': []},
                'latency_ms': 0,
                'error': 'Brain atlas not loaded'
            }

        start_time = time.time()
        prompt_tokens = self.tokenize(prompt)
        visual_feedback = {'accessed_indices': [], 'glyphs': []}

        # Generate tokens
        generated_tokens = []
        try:
            for i, token in enumerate(self.pipeline.generate(prompt_tokens, max_tokens=max_tokens)):
                generated_tokens.append(token)

                # Emit visual feedback
                if emit_visual:
                    bridge = self._get_visual_bridge()
                    if bridge and hasattr(bridge, 'emit_thought_pulse'):
                        bridge.emit_thought_pulse(
                            token_id=token,
                            position=(i * 50, 0),
                            intensity=1.0 - (i / max_tokens) * 0.5  # Fade over time
                        )
                        visual_feedback['glyphs'].append({
                            'token_id': token,
                            'position': (i * 50, 0)
                        })

                    # Get accessed weight indices
                    if hasattr(self.pipeline, 'get_last_accessed_indices'):
                        indices = self.pipeline.get_last_accessed_indices()
                        visual_feedback['accessed_indices'].extend(indices[:10])

                        if bridge and hasattr(bridge, 'emit_atlas_glow'):
                            bridge.emit_atlas_glow(
                                weight_indices=indices,
                                intensity=0.5,
                                duration_ms=200
                            )

                    # Small delay for visual effect
                    await asyncio.sleep(0.05)

        except Exception as e:
            logger.error(f"Generation error: {e}")
            return {
                'text': f'[Error: {e}]',
                'tokens': generated_tokens,
                'visual_feedback': visual_feedback,
                'latency_ms': (time.time() - start_time) * 1000,
                'error': str(e)
            }

        latency_ms = (time.time() - start_time) * 1000
        generated_text = self.detokenize(generated_tokens)

        return {
            'text': generated_text,
            'tokens': generated_tokens,
            'visual_feedback': visual_feedback,
            'latency_ms': latency_ms
        }

    async def complete(self, prompt: str, **kwargs) -> str:
        """
        Simple completion API - returns just the text.

        Args:
            prompt: Input prompt
            **kwargs: Passed to generate()

        Returns:
            Generated text string
        """
        result = await self.generate(prompt, **kwargs)
        return result.get('text', '')

    def is_available(self) -> bool:
        """Check if PixelBrain is ready for inference."""
        return self.pipeline is not None


# Global singleton accessor
_service_instance = None

def get_pixel_brain_service() -> PixelBrainService:
    """Get the global PixelBrainService singleton."""
    global _service_instance
    if _service_instance is None:
        _service_instance = PixelBrainService()
    return _service_instance
```

**Step 4: Run tests to verify**

```bash
pytest tests/test_pixel_brain_service.py -v
```

Expected: PASS (or skip if brain not available)

**Step 5: Commit**

```bash
git add systems/visual_shell/api/pixel_brain_service.py tests/test_pixel_brain_service.py
git commit -m "feat(pixel-brain): add universal cognitive service module"
```

---

### Task 1.2: Update WebMCP send_llm_prompt to use PixelBrain

**Files:**
- Modify: `systems/visual_shell/web/webmcp_bridge.js:4165-4280`
- Test: `tests/test_pixel_brain_service.py`

**Step 1: Add test for WebMCP integration**

Add to `tests/test_pixel_brain_service.py`:

```python
class TestWebMCPIntegration:
    """Test WebMCP send_llm_prompt uses PixelBrain."""

    @pytest.mark.asyncio
    async def test_send_llm_prompt_uses_pixel_brain(self):
        """send_llm_prompt should route through PixelBrainService."""
        from systems.visual_shell.api.pixel_brain_service import get_pixel_brain_service

        service = get_pixel_brain_service()

        # Skip if brain not available
        if not service.is_available():
            pytest.skip("PixelBrain not available")

        result = await service.generate("Hello", max_tokens=5)

        assert 'text' in result
        assert 'tokens' in result
        assert 'visual_feedback' in result
```

**Step 2: Run test**

```bash
pytest tests/test_pixel_brain_service.py::TestWebMCPIntegration -v
```

**Step 3: Update WebMCP bridge to route through Python backend**

Modify `systems/visual_shell/web/webmcp_bridge.js`:

Update `#handleSendLLMPrompt` method (around line 4165):

```javascript
async #handleSendLLMPrompt({
    prompt,
    model = 'pixel-brain',  // Changed from 'local'
    temperature = 0.7,
    max_tokens = 2048,
    system_prompt,
    use_pixel_brain = true  // New option
}) {
    this.#trackCall('send_llm_prompt');

    // Validate prompt
    if (typeof prompt !== 'string' || prompt.trim().length === 0) {
        return {
            success: false,
            error: 'prompt is required and must be a non-empty string',
            error_code: 'INVALID_INPUT'
        };
    }

    const startTime = Date.now();

    // Route through PixelBrain (native GPU inference)
    if (use_pixel_brain && model === 'pixel-brain') {
        try {
            // Call Python backend via WebSocket
            const response = await this.#callPixelBrainBackend({
                prompt,
                max_tokens,
                temperature,
                emit_visual: true
            });

            const latencyMs = Date.now() - startTime;

            return {
                success: true,
                content: response.text,
                tokens: response.tokens,
                visual_feedback: response.visual_feedback,
                latency_ms: latencyMs,
                model: 'pixel-brain-native',
                source: 'gpu-wgsl'
            };
        } catch (err) {
            // Fallback to LM Studio if PixelBrain fails
            console.warn('PixelBrain failed, falling back to LM Studio:', err.message);
        }
    }

    // Original LM Studio fallback logic...
    // (existing code continues)
}

async #callPixelBrainBackend(params) {
    // Send to Python backend via WebSocket
    return new Promise((resolve, reject) => {
        const requestId = ++this.#requestIdCounter;

        const handler = (event) => {
            try {
                const data = JSON.parse(event.data);
                if (data.request_id === requestId) {
                    this.#ws.removeEventListener('message', handler);
                    if (data.error) {
                        reject(new Error(data.error));
                    } else {
                        resolve(data);
                    }
                }
            } catch (e) {
                // Ignore parse errors
            }
        };

        this.#ws.addEventListener('message', handler);

        // Timeout after 30 seconds
        setTimeout(() => {
            this.#ws.removeEventListener('message', handler);
            reject(new Error('PixelBrain request timeout'));
        }, 30000);

        // Send request
        this.#ws.send(JSON.stringify({
            type: 'PIXEL_BRAIN_GENERATE',
            request_id: requestId,
            ...params
        }));
    });
}
```

**Step 4: Add WebSocket handler in visual_bridge.py**

Add to `systems/visual_shell/api/visual_bridge.py`:

```python
async def _handle_pixel_brain_generate(self, data: dict):
    """Handle PIXEL_BRAIN_GENERATE WebSocket request."""
    from systems.visual_shell.api.pixel_brain_service import get_pixel_brain_service

    request_id = data.get('request_id')
    prompt = data.get('prompt', '')
    max_tokens = data.get('max_tokens', 50)
    temperature = data.get('temperature', 0.7)

    service = get_pixel_brain_service()

    if not service.is_available():
        return {
            'request_id': request_id,
            'error': 'PixelBrain not available'
        }

    result = await service.generate(
        prompt=prompt,
        max_tokens=max_tokens,
        temperature=temperature,
        emit_visual=True
    )

    result['request_id'] = request_id
    return result
```

**Step 5: Run tests**

```bash
pytest tests/test_pixel_brain_service.py -v
```

**Step 6: Commit**

```bash
git add systems/visual_shell/web/webmcp_bridge.js systems/visual_shell/api/visual_bridge.py tests/test_pixel_brain_service.py
git commit -m "feat(webmcp): route send_llm_prompt through PixelBrain native inference"
```

---

## Phase 2: Autonomous Swarm Migration

**Goal:** Wire Swarm agents to use local PixelBrain instead of external APIs.

### Task 2.1: Create Swarm Agent LLM Backend

**Files:**
- Create: `systems/swarm/llm_backend.py`
- Test: `tests/test_swarm_llm_backend.py`

**Step 1: Write failing test**

Create `tests/test_swarm_llm_backend.py`:

```python
"""Tests for Swarm LLM backend using PixelBrain."""
import pytest


class TestSwarmLLMBackend:
    """Test swarm agents use PixelBrain for inference."""

    def test_backend_uses_pixel_brain(self):
        """SwarmLLMBackend should use PixelBrainService."""
        from systems.swarm.llm_backend import SwarmLLMBackend

        backend = SwarmLLMBackend()
        assert backend.service is not None

    @pytest.mark.asyncio
    async def test_backend_generate(self):
        """Backend should generate via PixelBrain."""
        from systems.swarm.llm_backend import SwarmLLMBackend

        backend = SwarmLLMBackend()

        if not backend.is_available():
            pytest.skip("PixelBrain not available")

        result = await backend.generate("Write hello world", max_tokens=20)
        assert isinstance(result, str)
        assert len(result) > 0
```

**Step 2: Create SwarmLLMBackend**

Create `systems/swarm/llm_backend.py`:

```python
"""
Swarm Agent LLM Backend

Provides unified LLM access for all swarm agents using PixelBrain.
Agents no longer call external APIs - they use the native cognitive core.

Usage:
    backend = SwarmLLMBackend()
    code = await backend.generate_code("Write a sorting function")
"""

import logging
from typing import Optional, Dict, Any

logger = logging.getLogger(__name__)


class SwarmLLMBackend:
    """
    LLM backend for swarm agents using PixelBrain native inference.

    This replaces any external API calls (OpenAI, Anthropic, LM Studio)
    with local GPU-accelerated inference.
    """

    def __init__(self):
        self.service = None
        self._initialize()

    def _initialize(self):
        """Initialize connection to PixelBrainService."""
        try:
            from systems.visual_shell.api.pixel_brain_service import get_pixel_brain_service
            self.service = get_pixel_brain_service()
            logger.info("SwarmLLMBackend connected to PixelBrainService")
        except Exception as e:
            logger.warning(f"PixelBrainService not available: {e}")
            self.service = None

    def is_available(self) -> bool:
        """Check if backend is ready."""
        return self.service is not None and self.service.is_available()

    async def generate(
        self,
        prompt: str,
        max_tokens: int = 100,
        temperature: float = 0.7,
        system_prompt: Optional[str] = None
    ) -> str:
        """
        Generate text completion.

        Args:
            prompt: Input prompt
            max_tokens: Maximum tokens to generate
            temperature: Sampling temperature
            system_prompt: Optional system prompt (ignored for now)

        Returns:
            Generated text
        """
        if not self.is_available():
            return "[PixelBrain not available - check brain atlas]"

        full_prompt = prompt
        if system_prompt:
            full_prompt = f"{system_prompt}\n\n{prompt}"

        result = await self.service.generate(
            prompt=full_prompt,
            max_tokens=max_tokens,
            temperature=temperature,
            emit_visual=True
        )

        return result.get('text', '')

    async def generate_code(
        self,
        description: str,
        language: str = "python",
        max_tokens: int = 500
    ) -> str:
        """
        Generate code from description.

        Args:
            description: What code to generate
            language: Programming language
            max_tokens: Maximum tokens

        Returns:
            Generated code
        """
        prompt = f"Write {language} code that: {description}\n\nCode:"
        return await self.generate(prompt, max_tokens=max_tokens, temperature=0.3)

    async def analyze(
        self,
        content: str,
        question: str,
        max_tokens: int = 200
    ) -> str:
        """
        Analyze content and answer question.

        Args:
            content: Content to analyze
            question: Question about the content
            max_tokens: Maximum tokens

        Returns:
            Analysis result
        """
        prompt = f"Content:\n{content}\n\nQuestion: {question}\n\nAnswer:"
        return await self.generate(prompt, max_tokens=max_tokens, temperature=0.5)


# Global singleton
_backend_instance = None

def get_swarm_llm_backend() -> SwarmLLMBackend:
    """Get global SwarmLLMBackend singleton."""
    global _backend_instance
    if _backend_instance is None:
        _backend_instance = SwarmLLMBackend()
    return _backend_instance
```

**Step 3: Run tests**

```bash
pytest tests/test_swarm_llm_backend.py -v
```

**Step 4: Commit**

```bash
git add systems/swarm/llm_backend.py tests/test_swarm_llm_backend.py
git commit -m "feat(swarm): add LLM backend using PixelBrain native inference"
```

---

### Task 2.2: Update Swarm Agents to Use Native Backend

**Files:**
- Modify: `systems/swarm/guilds/engineer.py`
- Modify: `systems/swarm/guilds/architect.py`
- Modify: `systems/swarm/guilds/reviewer.py`
- Test: `tests/test_swarm_agents_native.py`

**Step 1: Write test**

Create `tests/test_swarm_agents_native.py`:

```python
"""Tests for swarm agents using native LLM."""
import pytest


class TestSwarmAgentsNative:
    """Test swarm agents use PixelBrain."""

    @pytest.mark.asyncio
    async def test_engineer_agent_uses_native_llm(self):
        """EngineerAgent should use SwarmLLMBackend."""
        from systems.swarm.guilds.engineer import EngineerAgent

        agent = EngineerAgent()
        assert hasattr(agent, 'llm_backend')

        if not agent.llm_backend.is_available():
            pytest.skip("PixelBrain not available")

        # Agent should be able to generate code
        result = await agent.generate_code("print hello")
        assert result is not None

    @pytest.mark.asyncio
    async def test_architect_agent_uses_native_llm(self):
        """ArchitectAgent should use SwarmLLMBackend."""
        from systems.swarm.guilds.architect import ArchitectAgent

        agent = ArchitectAgent()
        assert hasattr(agent, 'llm_backend')
```

**Step 2: Update EngineerAgent**

Modify `systems/swarm/guilds/engineer.py`:

Add at top of file:
```python
from systems.swarm.llm_backend import get_swarm_llm_backend
```

In `__init__`:
```python
self.llm_backend = get_swarm_llm_backend()
```

Replace any `requests.post()` or `anthropic` calls with:
```python
result = await self.llm_backend.generate(prompt, max_tokens=500)
```

**Step 3: Run tests**

```bash
pytest tests/test_swarm_agents_native.py -v
```

**Step 4: Commit**

```bash
git add systems/swarm/guilds/engineer.py systems/swarm/guilds/architect.py systems/swarm/guilds/reviewer.py tests/test_swarm_agents_native.py
git commit -m "feat(swarm): migrate agents to use PixelBrain native LLM backend"
```

---

## Phase 3: Glass Box Dashboard

**Goal:** Visualize internal mechanics of the model during inference.

### Task 3.1: Create Attention Visualizer

**Files:**
- Create: `systems/visual_shell/web/AttentionVisualizer.js`
- Modify: `systems/visual_shell/wgsl/pixel_brain_pipeline.py`
- Test: `systems/visual_shell/web/tests/test_attention_visualizer.js`

**Step 1: Write test**

Create `systems/visual_shell/web/tests/test_attention_visualizer.js`:

```javascript
import { describe, it, expect, vi, beforeEach } from 'vitest';
import { AttentionVisualizer } from '../AttentionVisualizer.js';

describe('AttentionVisualizer', () => {
    let mockApp, mockContainer;

    beforeEach(() => {
        mockApp = {
            stage: { addChild: vi.fn() },
            ticker: { add: vi.fn() }
        };
        mockContainer = { addChild: vi.fn(), removeChild: vi.fn() };
    });

    it('should initialize with app and container', () => {
        const viz = new AttentionVisualizer(mockApp, mockContainer);
        expect(viz.app).toBe(mockApp);
    });

    it('should render attention patterns', () => {
        const viz = new AttentionVisualizer(mockApp, mockContainer);
        viz.renderAttention({
            head_weights: [[0.1, 0.9], [0.8, 0.2]],
            layer_idx: 0,
            seq_position: 5
        });
        expect(viz.patterns.length).toBe(1);
    });

    it('should emit ATTENTION_UPDATE events', () => {
        const viz = new AttentionVisualizer(mockApp, mockContainer);
        const listener = vi.fn();
        viz.on('attention_update', listener);

        viz.renderAttention({
            head_weights: [[0.5]],
            layer_idx: 0,
            seq_position: 0
        });

        expect(listener).toHaveBeenCalled();
    });
});
```

**Step 2: Create AttentionVisualizer**

Create `systems/visual_shell/web/AttentionVisualizer.js`:

```javascript
/**
 * AttentionVisualizer - Glass Box Dashboard for PixelBrain
 *
 * Renders internal attention patterns, probability distributions,
 * and weight activations in real-time during inference.
 *
 * Makes the model's "thinking" visible.
 */

import * as PIXI from 'pixi.js';

export class AttentionVisualizer {
    constructor(app, container = null) {
        this.app = app;
        this.container = container || app.stage;
        this.patterns = [];
        this.listeners = new Map();

        // Create attention heatmap container
        this.heatmapContainer = new PIXI.Container();
        this.container.addChild(this.heatmapContainer);

        // Register for updates
        this.app.ticker.add((ticker) => {
            this.update(ticker.deltaMS);
        });
    }

    /**
     * Render attention patterns for a layer.
     *
     * @param {Object} data - Attention data
     * @param {number[][]} data.head_weights - Per-head attention weights
     * @param {number} data.layer_idx - Transformer layer index
     * @param {number} data.seq_position - Current sequence position
     */
    renderAttention(data) {
        const { head_weights, layer_idx, seq_position } = data;

        // Create graphics for this attention pattern
        const graphics = new PIXI.Graphics();
        const numHeads = head_weights.length;
        const headSize = 32;

        // Draw each attention head
        for (let h = 0; h < numHeads; h++) {
            const weights = head_weights[h];
            const headX = (layer_idx * numHeads + h) * (headSize + 4);

            // Draw attention heatmap for this head
            for (let i = 0; i < weights.length; i++) {
                const intensity = Math.min(1, Math.max(0, weights[i]));
                const color = this._intensityToColor(intensity);

                graphics.rect(headX, i * 4, headSize, 3);
                graphics.fill({ color, alpha: intensity });
            }
        }

        this.heatmapContainer.addChild(graphics);

        const pattern = {
            graphics,
            layer_idx,
            seq_position,
            startTime: Date.now(),
            lifetime: 2000
        };

        this.patterns.push(pattern);

        // Emit event
        this._emit('attention_update', {
            layer_idx,
            seq_position,
            num_heads: numHeads
        });

        return pattern;
    }

    /**
     * Render probability distribution over tokens.
     *
     * @param {Object} data - Distribution data
     * @param {number[]} data.probs - Token probabilities
     * @param {number} data.top_token - Highest probability token
     */
    renderDistribution(data) {
        const { probs, top_token } = data;

        // Create distribution bar
        const graphics = new PIXI.Graphics();

        // Show top 10 tokens
        const top10 = probs.slice(0, 10);
        const barWidth = 20;

        for (let i = 0; i < top10.length; i++) {
            const prob = top10[i];
            const height = prob * 100;

            graphics.rect(
                i * (barWidth + 2),
                100 - height,
                barWidth,
                height
            );

            // Highlight top token
            if (i === 0) {
                graphics.fill({ color: 0x00FF00 });  // Green for top
            } else {
                graphics.fill({ color: 0x4488FF, alpha: 0.5 });
            }
        }

        this.heatmapContainer.addChild(graphics);

        // Auto-remove after 3 seconds
        setTimeout(() => {
            this.heatmapContainer.removeChild(graphics);
            graphics.destroy();
        }, 3000);
    }

    update(deltaMs) {
        const now = Date.now();
        const toRemove = [];

        for (const pattern of this.patterns) {
            const elapsed = now - pattern.startTime;
            const progress = elapsed / pattern.lifetime;

            if (progress >= 1) {
                toRemove.push(pattern);
                continue;
            }

            // Fade out
            pattern.graphics.alpha = 1 - progress;
        }

        // Remove expired patterns
        for (const pattern of toRemove) {
            this.heatmapContainer.removeChild(pattern.graphics);
            pattern.graphics.destroy();
            const idx = this.patterns.indexOf(pattern);
            if (idx >= 0) {
                this.patterns.splice(idx, 1);
            }
        }
    }

    _intensityToColor(intensity) {
        // Blue -> Cyan -> Green -> Yellow -> Red
        if (intensity < 0.25) {
            return 0x0044FF;
        } else if (intensity < 0.5) {
            return 0x00FFFF;
        } else if (intensity < 0.75) {
            return 0x00FF00;
        } else if (intensity < 0.9) {
            return 0xFFFF00;
        } else {
            return 0xFF4400;
        }
    }

    on(event, callback) {
        if (!this.listeners.has(event)) {
            this.listeners.set(event, []);
        }
        this.listeners.get(event).push(callback);
    }

    _emit(event, data) {
        const callbacks = this.listeners.get(event) || [];
        for (const cb of callbacks) {
            cb(data);
        }
    }

    clear() {
        for (const pattern of this.patterns) {
            this.heatmapContainer.removeChild(pattern.graphics);
            pattern.graphics.destroy();
        }
        this.patterns = [];
    }
}

export default AttentionVisualizer;
```

**Step 3: Run tests**

```bash
cd systems/visual_shell/web && npx vitest run tests/test_attention_visualizer.js
```

**Step 4: Commit**

```bash
git add systems/visual_shell/web/AttentionVisualizer.js systems/visual_shell/web/tests/test_attention_visualizer.js
git commit -m "feat(visual-shell): add AttentionVisualizer for glass box dashboard"
```

---

### Task 3.2: Wire Attention Data to Visualizer

**Files:**
- Modify: `systems/visual_shell/wgsl/pixel_brain_attention.wgsl`
- Modify: `systems/visual_shell/wgsl/pixel_brain_pipeline.py`
- Modify: `systems/visual_shell/api/pixel_brain_service.py`

**Step 1: Add attention output to shader**

Modify `pixel_brain_attention.wgsl` to output attention weights:

Add to bindings:
```wgsl
// Output: Attention weights for visualization
struct AttentionOutput {
    head_weights: array<f32>,  // [NUM_HEADS * seq_len]
}
@group(0) @binding(5) var<storage, read_write> attention_output: AttentionOutput;
```

Store weights in `attention_head` function:
```wgsl
// Store for visualization
attention_output.head_weights[head * seq_len + i] = weights[i];
```

**Step 2: Add attention data to pipeline output**

Modify `pixel_brain_pipeline.py`:

Add method:
```python
def get_attention_weights(self, layer: int) -> List[List[float]]:
    """Get attention weights from last forward pass."""
    # Read from GPU buffer
    if not self._wgpu_initialized:
        return [[0.5] * 8 for _ in range(8)]  # Dummy

    # Read attention output buffer
    return self._read_attention_buffer(layer)
```

**Step 3: Emit attention events in service**

Modify `pixel_brain_service.py`:

Add to `generate()`:
```python
# After each layer, emit attention visualization
if hasattr(self.pipeline, 'get_attention_weights'):
    weights = self.pipeline.get_attention_weights(layer)
    if bridge and hasattr(bridge, 'emit_attention_pattern'):
        bridge.emit_attention_pattern({
            'head_weights': weights,
            'layer_idx': layer,
            'seq_position': i
        })
```

**Step 4: Commit**

```bash
git add systems/visual_shell/wgsl/pixel_brain_attention.wgsl systems/visual_shell/wgsl/pixel_brain_pipeline.py systems/visual_shell/api/pixel_brain_service.py
git commit -m "feat(pixel-brain): wire attention weights to glass box visualizer"
```

---

## Phase 4: Recursive Evolution

**Goal:** Enable Evolution Daemon to mutate the brain itself.

### Task 4.1: Create Brain Mutation Targets

**Files:**
- Create: `systems/evolution_daemon/brain_mutations.py`
- Test: `tests/test_brain_mutations.py`

**Step 1: Write failing test**

Create `tests/test_brain_mutations.py`:

```python
"""Tests for brain evolution mutations."""
import pytest
import numpy as np


class TestBrainMutations:
    """Test evolution daemon can mutate the brain."""

    def test_weight_mutation_applies(self):
        """Weight mutation should modify atlas."""
        from systems.evolution_daemon.brain_mutations import mutate_weight_sector

        atlas = np.zeros((1024, 1024, 4), dtype=np.float16)
        result = mutate_weight_sector(atlas, sector="attention_layer_0", rate=0.01)

        assert result is not None
        assert not np.allclose(atlas, np.zeros_like(atlas))

    def test_shader_mutation_generates_code(self):
        """Shader mutation should generate WGSL variant."""
        from systems.evolution_daemon.brain_mutations import mutate_shader

        original = "fn silu(x: f32) -> f32 { return x / (1.0 + exp(-x)); }"
        result = mutate_shader(original, mutation_type="activation")

        assert result != original
        assert "fn silu" in result or "fn " in result  # Still a function

    def test_brain_fitness_evaluates(self):
        """Should evaluate brain fitness on test cases."""
        from systems.evolution_daemon.brain_mutations import evaluate_brain_fitness

        fitness = evaluate_brain_fitness(
            brain_path="tinystories_brain.rts.png",
            test_prompts=["Hello", "Once upon"]
        )

        assert isinstance(fitness, float)
        assert 0 <= fitness <= 1
```

**Step 2: Create brain_mutations.py**

Create `systems/evolution_daemon/brain_mutations.py`:

```python
"""
Brain Mutations - Evolution Daemon Integration for PixelBrain

Enables the Evolution Daemon to mutate:
1. Weight atlas sectors (fine-tuning)
2. WGSL shader code (architecture search)
3. GeoASM orchestration (control flow evolution)

This makes the OS capable of improving its own cognitive engine.
"""

import numpy as np
from typing import Optional, List, Dict, Tuple
import logging
import random

logger = logging.getLogger(__name__)


def mutate_weight_sector(
    atlas: np.ndarray,
    sector: str,
    rate: float = 0.01,
    mutation_type: str = "gaussian"
) -> np.ndarray:
    """
    Apply mutation to a weight sector in the atlas.

    Args:
        atlas: Weight atlas array (1024x1024x4)
        sector: Sector name (e.g., "attention_layer_0", "embeddings")
        rate: Mutation rate (0-1)
        mutation_type: "gaussian", "uniform", or "crossover"

    Returns:
        Modified atlas (in-place mutation)
    """
    # Get sector bounds
    bounds = _get_sector_bounds(sector)
    if bounds is None:
        logger.warning(f"Unknown sector: {sector}")
        return atlas

    x_start, x_end, y_start, y_end = bounds
    sector_slice = atlas[y_start:y_end, x_start:x_end]

    if mutation_type == "gaussian":
        noise = np.random.normal(0, rate, sector_slice.shape).astype(np.float16)
        sector_slice += noise
    elif mutation_type == "uniform":
        mask = np.random.random(sector_slice.shape) < rate
        noise = np.random.uniform(-0.1, 0.1, sector_slice.shape).astype(np.float16)
        sector_slice = np.where(mask, sector_slice + noise, sector_slice)

    atlas[y_start:y_end, x_start:x_end] = sector_slice
    return atlas


def _get_sector_bounds(sector: str) -> Optional[Tuple[int, int, int, int]]:
    """Get pixel bounds for a weight sector."""
    # Approximate sector locations in 1024x1024 atlas
    sectors = {
        "embeddings": (0, 256, 0, 512),
        "attention_layer_0": (256, 384, 0, 256),
        "attention_layer_1": (384, 512, 0, 256),
        "ffn_layer_0": (256, 384, 256, 512),
        "ffn_layer_1": (384, 512, 256, 512),
        "lm_head": (512, 1024, 512, 1024),
    }
    return sectors.get(sector)


def mutate_shader(
    original_code: str,
    mutation_type: str = "activation"
) -> str:
    """
    Apply mutation to WGSL shader code.

    Args:
        original_code: Original WGSL code
        mutation_type: Type of mutation to apply

    Returns:
        Mutated WGSL code
    """
    mutations = {
        "activation": _mutate_activation,
        "normalization": _mutate_normalization,
        "attention": _mutate_attention_pattern,
    }

    mutator = mutations.get(mutation_type, lambda x: x)
    return mutator(original_code)


def _mutate_activation(code: str) -> str:
    """Mutate activation functions."""
    activations = [
        ("silu(x)", "x / (1.0 + exp(-x))"),
        ("relu(x)", "max(0.0, x)"),
        ("gelu(x)", "0.5 * x * (1.0 + tanh(0.7978845608 * (x + 0.044715 * x * x * x)))"),
        ("tanh(x)", "tanh(x)"),
    ]

    result = code
    if "silu" in code.lower():
        # Randomly replace with different activation
        new_act = random.choice(activations)
        result = code.replace(
            "return x / (1.0 + exp(-x));",
            f"return {new_act[1]};"
        )

    return result


def _mutate_normalization(code: str) -> str:
    """Mutate normalization patterns."""
    # Swap layer norm with RMS norm occasionally
    if "layer_norm" in code and random.random() < 0.3:
        return code.replace("layer_norm", "rms_norm")
    return code


def _mutate_attention_pattern(code: str) -> str:
    """Mutate attention computation."""
    # Occasionally add attention scaling variants
    if "score / sqrt" in code and random.random() < 0.2:
        return code.replace(
            "score / sqrt(f32(HEAD_DIM))",
            "score * 0.3535"  # Approximate 1/sqrt(8)
        )
    return code


def evaluate_brain_fitness(
    brain_path: str,
    test_prompts: List[str],
    criteria: str = "coherence"
) -> float:
    """
    Evaluate brain fitness on test cases.

    Args:
        brain_path: Path to brain atlas
        test_prompts: Test prompts to evaluate
        criteria: Fitness criteria

    Returns:
        Fitness score (0-1)
    """
    try:
        from systems.visual_shell.wgsl.pixel_brain_pipeline import PixelBrainPipeline
        from systems.visual_shell.api.pixel_brain_service import get_pixel_brain_service

        service = get_pixel_brain_service()

        if not service.is_available():
            return 0.0

        # Run test prompts and evaluate outputs
        total_score = 0.0

        for prompt in test_prompts:
            result = service.generate(prompt, max_tokens=10)
            text = result.get('text', '')

            # Simple coherence check
            score = _evaluate_coherence(text)
            total_score += score

        return total_score / len(test_prompts)

    except Exception as e:
        logger.error(f"Fitness evaluation failed: {e}")
        return 0.0


def _evaluate_coherence(text: str) -> float:
    """Simple coherence evaluation."""
    if not text or len(text) < 5:
        return 0.0

    # Check for basic coherence signals
    score = 0.5

    # Has spaces (word-like)
    if ' ' in text:
        score += 0.1

    # Has common words
    common = ['the', 'a', 'is', 'was', 'to', 'and']
    for word in common:
        if word in text.lower():
            score += 0.05

    # Not all same character
    if len(set(text)) > 3:
        score += 0.1

    return min(1.0, score)


# Evolution Daemon Integration
def register_brain_as_evolution_target():
    """Register PixelBrain as an evolution target."""
    try:
        from systems.evolution_daemon.evolution_daemon import EvolutionDaemon

        daemon = EvolutionDaemon()

        # Register weight mutation
        daemon.register_mutation_target(
            name="pixel_brain_weights",
            mutate_fn=mutate_weight_sector,
            evaluate_fn=lambda: evaluate_brain_fitness("tinystories_brain.rts.png", ["test"]),
            sector="cognitive"
        )

        # Register shader mutation
        daemon.register_mutation_target(
            name="pixel_brain_shaders",
            mutate_fn=mutate_shader,
            evaluate_fn=lambda: 0.5,  # TODO: Shader fitness
            sector="cognitive"
        )

        logger.info("PixelBrain registered as evolution target")
        return True

    except Exception as e:
        logger.warning(f"Failed to register evolution target: {e}")
        return False
```

**Step 3: Run tests**

```bash
pytest tests/test_brain_mutations.py -v
```

**Step 4: Commit**

```bash
git add systems/evolution_daemon/brain_mutations.py tests/test_brain_mutations.py
git commit -m "feat(evolution): add brain mutation targets for recursive evolution"
```

---

### Task 4.2: Wire Brain Evolution to Daemon

**Files:**
- Modify: `systems/evolution_daemon/evolution_daemon.py`
- Create: `systems/evolution_daemon/hooks/brain_evolution_hook.py`

**Step 1: Add brain evolution hook**

Create `systems/evolution_daemon/hooks/brain_evolution_hook.py`:

```python
"""
Brain Evolution Hook - Triggers cognitive engine evolution.

When the Evolution Daemon runs, this hook can:
1. Mutate weight atlas sectors
2. Evolve WGSL shader code
3. Fine-tune GeoASM orchestration
"""

import logging
from typing import Dict, Any

logger = logging.getLogger(__name__)


class BrainEvolutionHook:
    """Hook for evolving PixelBrain through Evolution Daemon."""

    def __init__(self, brain_path: str = "tinystories_brain.rts.png"):
        self.brain_path = brain_path
        self.mutation_history = []

    async def on_evolution_cycle(self, cycle_data: Dict[str, Any]):
        """Called during each evolution cycle."""
        from systems.evolution_daemon.brain_mutations import (
            mutate_weight_sector,
            evaluate_brain_fitness
        )

        # Check if brain evolution is enabled
        if not cycle_data.get('evolve_brain', False):
            return

        # Select sector to mutate
        sector = self._select_sector(cycle_data)
        if not sector:
            return

        # Evaluate current fitness
        pre_fitness = evaluate_brain_fitness(self.brain_path, ["test"])

        # Apply mutation
        import numpy as np
        try:
            import imageio
            atlas = imageio.imread(self.brain_path)

            mutated = mutate_weight_sector(
                atlas,
                sector=sector,
                rate=cycle_data.get('mutation_rate', 0.01)
            )

            # Evaluate post-mutation fitness
            post_fitness = evaluate_brain_fitness(self.brain_path, ["test"])

            # Keep or revert based on fitness
            if post_fitness >= pre_fitness:
                # Save mutated atlas
                imageio.imwrite(self.brain_path, mutated)
                logger.info(f"Brain evolved: {sector} fitness {pre_fitness:.3f} -> {post_fitness:.3f}")

                self.mutation_history.append({
                    'sector': sector,
                    'pre_fitness': pre_fitness,
                    'post_fitness': post_fitness,
                    'kept': True
                })
            else:
                logger.info(f"Brain mutation rejected: fitness decreased")
                self.mutation_history.append({
                    'sector': sector,
                    'pre_fitness': pre_fitness,
                    'post_fitness': post_fitness,
                    'kept': False
                })

        except Exception as e:
            logger.error(f"Brain evolution failed: {e}")

    def _select_sector(self, cycle_data: Dict[str, Any]) -> str:
        """Select which sector to mutate."""
        sectors = [
            "embeddings",
            "attention_layer_0",
            "attention_layer_1",
            "ffn_layer_0",
            "ffn_layer_1",
            "lm_head"
        ]

        # Use cycle entropy for selection
        import random
        return random.choice(sectors)


# Register hook
def register_hook():
    """Register brain evolution hook with Evolution Daemon."""
    from systems.evolution_daemon.evolution_daemon import EvolutionDaemon

    hook = BrainEvolutionHook()
    daemon = EvolutionDaemon()

    daemon.register_hook('evolution_cycle', hook.on_evolution_cycle)
    logger.info("Brain evolution hook registered")
```

**Step 2: Register in evolution_daemon.py**

Add to `evolution_daemon.py` imports:
```python
from systems.evolution_daemon.hooks.brain_evolution_hook import register_hook as register_brain_hook
```

Add to daemon initialization:
```python
# Register brain evolution hook
try:
    register_brain_hook()
except Exception as e:
    logger.warning(f"Brain evolution hook registration failed: {e}")
```

**Step 3: Commit**

```bash
git add systems/evolution_daemon/hooks/brain_evolution_hook.py systems/evolution_daemon/evolution_daemon.py
git commit -m "feat(evolution): wire brain evolution hook to daemon"
```

---

## Verification Checklist

After all phases complete, verify:

- [ ] `send_llm_prompt` routes through PixelBrain
- [ ] Swarm agents use native LLM backend
- [ ] Attention patterns visible in dashboard
- [ ] Evolution daemon can mutate brain weights
- [ ] Full offline operation (no external APIs)
- [ ] Visual feedback on all inference

---

## Files Changed Summary

| Phase | File | Action | Lines |
|-------|------|--------|-------|
| 1 | `systems/visual_shell/api/pixel_brain_service.py` | Create | +150 |
| 1 | `systems/visual_shell/web/webmcp_bridge.js` | Modify | +60 |
| 1 | `tests/test_pixel_brain_service.py` | Create | +60 |
| 2 | `systems/swarm/llm_backend.py` | Create | +100 |
| 2 | `systems/swarm/guilds/engineer.py` | Modify | +20 |
| 2 | `tests/test_swarm_llm_backend.py` | Create | +40 |
| 3 | `systems/visual_shell/web/AttentionVisualizer.js` | Create | +180 |
| 3 | `systems/visual_shell/wgsl/pixel_brain_pipeline.py` | Modify | +30 |
| 4 | `systems/evolution_daemon/brain_mutations.py` | Create | +200 |
| 4 | `systems/evolution_daemon/hooks/brain_evolution_hook.py` | Create | +80 |

**Total: ~920 lines of code + tests**

---

## Execution Handoff

**Plan complete and saved to `docs/plans/2026-03-09-pixel-brain-cognitive-core.md`.**

**Two execution options:**

**1. Subagent-Driven (this session)** - I dispatch fresh subagent per task, review between tasks, fast iteration

**2. Parallel Session (separate)** - Open new session with executing-plans, batch execution with checkpoints

**Which approach?**
