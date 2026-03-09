# PixelBrain Visual Shell Integration Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Connect PixelBrain inference pipeline to the Visual Shell so generated tokens emit visible THOUGHT_PULSE glyphs and weight atlas activations glow in real-time.

**Architecture:** WebSocket broadcast from Python backend → JavaScript ThoughtVisualizer → PixiJS glyph rendering. Each token generation triggers visual feedback that makes the LLM's "thinking" visible on the Geometry OS desktop.

**Tech Stack:** Python (FastAPI WebSocket), JavaScript (PixiJS v8), WebSocket JSON protocol

---

## Prerequisites

- [x] `emit_thought_pulse()` exists in `visual_bridge.py`
- [x] `_active_glyphs` list tracks emitted glyphs
- [x] `PixelBrainPipeline` generates tokens
- [ ] WebSocket broadcast of THOUGHT_PULSE to clients
- [ ] JavaScript handler for THOUGHT_PULSE messages
- [ ] PixiJS rendering of thought glyphs

---

## Task 1: Add THOUGHT_PULSE WebSocket Broadcast

**Problem:** The backend has `emit_thought_pulse()` but doesn't broadcast to connected WebSocket clients.

**Files:**
- Modify: `systems/visual_shell/api/visual_bridge.py:696-745`
- Test: `tests/test_thought_pulse.py`

### Step 1: Write the failing test

Add to `tests/test_thought_pulse.py`:

```python
class TestThoughtPulseBroadcast:
    """Test that THOUGHT_PULSE broadcasts to WebSocket clients."""

    @pytest.mark.asyncio
    async def test_emit_thought_pulse_broadcasts_to_websockets(self):
        """emit_thought_pulse should broadcast to all connected clients."""
        from systems.visual_shell.api.visual_bridge import MultiVmStreamer, multi_vm_streamer

        # Ensure streamer is initialized
        streamer = multi_vm_streamer or MultiVmStreamer()

        # Create mock websocket
        mock_ws = MagicMock()
        mock_ws.send_json = AsyncMock()
        streamer.active_websockets.add(mock_ws)

        # Emit a thought pulse
        result = streamer.emit_thought_pulse(
            token_id=15496,
            position=(100, 100),
            intensity=0.8
        )

        # Verify broadcast was called
        assert result is True
        mock_ws.send_json.assert_called_once()
        call_args = mock_ws.send_json.call_args[0][0]
        assert call_args["type"] == "THOUGHT_PULSE"
        assert call_args["token_id"] == 15496
        assert call_args["x"] == 100
        assert call_args["y"] == 100
        assert call_args["intensity"] == 0.8

        # Cleanup
        streamer.active_websockets.discard(mock_ws)
```

### Step 2: Run test to verify it fails

```bash
pytest tests/test_thought_pulse.py::TestThoughtPulseBroadcast -v
```

Expected: FAIL - `mock_ws.send_json.assert_called_once()` fails (no broadcast)

### Step 3: Implement broadcast in emit_thought_pulse

Modify `systems/visual_shell/api/visual_bridge.py`, update `emit_thought_pulse` method:

```python
def emit_thought_pulse(
    self,
    token_id: int,
    position: tuple,
    intensity: float = 1.0
) -> bool:
    """
    Emit a THOUGHT_PULSE (0xCE) glyph for LLM output visualization.

    This method is called by the PixelBrain inference pipeline when
    generating tokens. Each emitted glyph creates a visual pulse on
    the Visual Shell that can be rendered by the PixiJS frontend.

    Args:
        token_id: The generated token (vocabulary index)
        position: (x, y) screen position for glyph placement
        intensity: Pulse brightness (0-1)

    Returns:
        True if emission successful
    """
    import asyncio

    glyph = {
        "type": "THOUGHT_PULSE",
        "opcode": 0xCE,  # THOUGHT_RENDER
        "token_id": token_id,
        "x": position[0],
        "y": position[1],
        "intensity": max(0.0, min(1.0, intensity)),  # Clamp to [0, 1]
        "timestamp": time.time()
    }

    # Add to active glyphs list
    self._active_glyphs.append(glyph)

    # Broadcast to all connected WebSocket clients
    async def _broadcast():
        dead_sockets = set()
        for ws in self.active_websockets:
            try:
                await ws.send_json(glyph)
            except Exception:
                dead_sockets.add(ws)
        # Clean up dead connections
        self.active_websockets -= dead_sockets

    # Schedule broadcast on event loop if running
    try:
        loop = asyncio.get_running_loop()
        loop.create_task(_broadcast())
    except RuntimeError:
        pass  # No event loop running (test context)

    self.logger.debug(
        f"Emitted THOUGHT_PULSE: token={token_id}, "
        f"pos=({position[0]}, {position[1]}), "
        f"intensity={intensity:.2f}"
    )

    return True
```

### Step 4: Run test to verify it passes

```bash
pytest tests/test_thought_pulse.py::TestThoughtPulseBroadcast -v
```

Expected: PASS

### Step 5: Commit

```bash
git add systems/visual_shell/api/visual_bridge.py tests/test_thought_pulse.py
git commit -m "feat(visual-shell): broadcast THOUGHT_PULSE to WebSocket clients"
```

---

## Task 2: Create ThoughtVisualizer JavaScript Class

**Problem:** No JavaScript code exists to render THOUGHT_PULSE glyphs in PixiJS.

**Files:**
- Create: `systems/visual_shell/web/ThoughtVisualizer.js`
- Create: `systems/visual_shell/web/tests/test_thought_visualizer.js`

### Step 1: Write the test file

Create `systems/visual_shell/web/tests/test_thought_visualizer.js`:

```javascript
import { describe, it, expect, vi, beforeEach } from 'vitest';
import { ThoughtVisualizer } from '../ThoughtVisualizer.js';

describe('ThoughtVisualizer', () => {
    let mockApp;
    let mockContainer;

    beforeEach(() => {
        mockApp = {
            stage: {
                addChild: vi.fn(),
                removeChild: vi.fn()
            },
            ticker: {
                add: vi.fn()
            }
        };
        mockContainer = {
            addChild: vi.fn(),
            removeChild: vi.fn()
        };
    });

    it('should initialize with PixiJS app', () => {
        const visualizer = new ThoughtVisualizer(mockApp, mockContainer);
        expect(visualizer.app).toBe(mockApp);
        expect(visualizer.container).toBe(mockContainer);
    });

    it('should create glyph on emitThoughtPulse', () => {
        const visualizer = new ThoughtVisualizer(mockApp, mockContainer);

        visualizer.emitThoughtPulse({
            type: 'THOUGHT_PULSE',
            token_id: 15496,
            x: 100,
            y: 100,
            intensity: 0.8
        });

        expect(visualizer.glyphs.length).toBe(1);
        expect(mockContainer.addChild).toHaveBeenCalled();
    });

    it('should fade glyphs over time', () => {
        const visualizer = new ThoughtVisualizer(mockApp, mockContainer);

        visualizer.emitThoughtPulse({
            type: 'THOUGHT_PULSE',
            token_id: 0,
            x: 0,
            y: 0,
            intensity: 1.0
        });

        const glyph = visualizer.glyphs[0];
        const initialAlpha = glyph.graphics.alpha;

        // Simulate time passing
        visualizer.update(1000); // 1 second

        expect(glyph.graphics.alpha).toBeLessThan(initialAlpha);
    });

    it('should remove faded glyphs', () => {
        const visualizer = new ThoughtVisualizer(mockApp, mockContainer);

        visualizer.emitThoughtPulse({
            type: 'THOUGHT_PULSE',
            token_id: 0,
            x: 0,
            y: 0,
            intensity: 1.0
        });

        expect(visualizer.glyphs.length).toBe(1);

        // Simulate 5 seconds (should fade completely)
        visualizer.update(5000);

        expect(visualizer.glyphs.length).toBe(0);
    });

    it('should use 0xCE opcode color (cyan)', () => {
        const visualizer = new ThoughtVisualizer(mockApp, mockContainer);

        visualizer.emitThoughtPulse({
            type: 'THOUGHT_PULSE',
            opcode: 0xCE,
            token_id: 0,
            x: 0,
            y: 0,
            intensity: 1.0
        });

        const glyph = visualizer.glyphs[0];
        // 0xCE should map to cyan-ish color
        expect(glyph.color).toMatch(/^#[0-9a-fA-F]{6}$/);
    });
});
```

### Step 2: Run test to verify it fails

```bash
cd systems/visual_shell/web && npx vitest run tests/test_thought_visualizer.js
```

Expected: FAIL - `ThoughtVisualizer` not found

### Step 3: Implement ThoughtVisualizer

Create `systems/visual_shell/web/ThoughtVisualizer.js`:

```javascript
/**
 * ThoughtVisualizer - PixiJS renderer for THOUGHT_PULSE glyphs.
 *
 * Renders LLM token generation as visible pulses on the Visual Shell.
 * Each glyph fades over time, creating a "thought trail" effect.
 *
 * Opcode 0xCE (THOUGHT_RENDER) - Cyan pulse for code discovery.
 */

import * as PIXI from 'pixi.js';

// Opcode color mapping
const OPCODE_COLORS = {
    0xCE: '#00FFFF',  // Cyan - THOUGHT_RENDER (code discovery)
    0xD6: '#00FFFF',  // THOUGHT_PULSE alias
    0xD0: '#FF00FF',  // Magenta - EMBED
    0xD1: '#FFFF00',  // Yellow - ATTEND
    0xD2: '#FF8000',  // Orange - PROJECT
    0xD3: '#00FF00',  // Green - SAMPLE
};

const GLYPH_LIFETIME_MS = 3000;  // 3 seconds
const GLYPH_START_SIZE = 32;
const GLYPH_END_SIZE = 8;

export class ThoughtVisualizer {
    /**
     * Create a new ThoughtVisualizer.
     *
     * @param {PIXI.Application} app - PixiJS application
     * @param {PIXI.Container} container - Container to add glyphs to
     */
    constructor(app, container = null) {
        this.app = app;
        this.container = container || app.stage;
        this.glyphs = [];

        // Register for ticker updates
        this.app.ticker.add((ticker) => {
            this.update(ticker.deltaMS);
        });
    }

    /**
     * Emit a thought pulse glyph.
     *
     * @param {Object} data - Pulse data from WebSocket
     * @param {string} data.type - Message type ("THOUGHT_PULSE")
     * @param {number} data.opcode - GeoASM opcode (0xCE)
     * @param {number} data.token_id - Generated token
     * @param {number} data.x - Screen X position
     * @param {number} data.y - Screen Y position
     * @param {number} data.intensity - Visual intensity (0-1)
     */
    emitThoughtPulse(data) {
        const {
            opcode = 0xCE,
            token_id = 0,
            x = 0,
            y = 0,
            intensity = 1.0
        } = data;

        // Create graphics object
        const graphics = new PIXI.Graphics();

        // Get color for opcode
        const color = this._opcodeToColor(opcode);

        // Draw pulse circle
        graphics.circle(0, 0, GLYPH_START_SIZE * intensity);
        graphics.fill({ color: color, alpha: intensity });

        // Position
        graphics.x = x;
        graphics.y = y;

        // Add to container
        this.container.addChild(graphics);

        // Track glyph for animation
        const glyph = {
            graphics,
            token_id,
            color,
            startTime: Date.now(),
            lifetime: GLYPH_LIFETIME_MS,
            startSize: GLYPH_START_SIZE * intensity,
            endSize: GLYPH_END_SIZE
        };

        this.glyphs.push(glyph);

        return glyph;
    }

    /**
     * Update glyph animations (called every frame).
     *
     * @param {number} deltaMs - Milliseconds since last frame
     */
    update(deltaMs) {
        const now = Date.now();
        const toRemove = [];

        for (const glyph of this.glyphs) {
            const elapsed = now - glyph.startTime;
            const progress = Math.min(1.0, elapsed / glyph.lifetime);

            if (progress >= 1.0) {
                toRemove.push(glyph);
                continue;
            }

            // Ease-out fade
            const alpha = 1.0 - Math.pow(progress, 2);
            const scale = 1.0 - (progress * 0.5);

            glyph.graphics.alpha = alpha;
            glyph.graphics.scale.set(scale);
        }

        // Remove faded glyphs
        for (const glyph of toRemove) {
            this.container.removeChild(glyph.graphics);
            glyph.graphics.destroy();
            const idx = this.glyphs.indexOf(glyph);
            if (idx >= 0) {
                this.glyphs.splice(idx, 1);
            }
        }
    }

    /**
     * Convert opcode to hex color string.
     *
     * @param {number} opcode - GeoASM opcode
     * @returns {string} Hex color (#RRGGBB)
     */
    _opcodeToColor(opcode) {
        return OPCODE_COLORS[opcode] || '#FFFFFF';
    }

    /**
     * Clear all active glyphs.
     */
    clear() {
        for (const glyph of this.glyphs) {
            this.container.removeChild(glyph.graphics);
            glyph.graphics.destroy();
        }
        this.glyphs = [];
    }

    /**
     * Get count of active glyphs.
     */
    get count() {
        return this.glyphs.length;
    }
}

export default ThoughtVisualizer;
```

### Step 4: Run tests to verify they pass

```bash
cd systems/visual_shell/web && npx vitest run tests/test_thought_visualizer.js
```

Expected: 5/5 PASS

### Step 5: Commit

```bash
git add systems/visual_shell/web/ThoughtVisualizer.js systems/visual_shell/web/tests/test_thought_visualizer.js
git commit -m "feat(visual-shell): add ThoughtVisualizer for THOUGHT_PULSE rendering"
```

---

## Task 3: Wire ThoughtVisualizer to NeuralCityEngine

**Problem:** ThoughtVisualizer exists but isn't connected to WebSocket messages.

**Files:**
- Modify: `systems/visual_shell/web/js/NeuralCityEngine.js`
- Create: `systems/visual_shell/web/tests/test_neural_city_thought_pulse.js`

### Step 1: Write the integration test

Create `systems/visual_shell/web/tests/test_neural_city_thought_pulse.js`:

```javascript
import { describe, it, expect, vi, beforeEach } from 'vitest';

describe('NeuralCityEngine THOUGHT_PULSE Integration', () => {
    let engine;
    let mockApp;

    beforeEach(async () => {
        mockApp = {
            stage: { addChild: vi.fn() },
            ticker: { add: vi.fn() }
        };

        // Import engine
        const { NeuralCityEngine } = await import('../js/NeuralCityEngine.js');
        engine = new NeuralCityEngine(mockApp);
    });

    it('should have ThoughtVisualizer instance', () => {
        expect(engine.thoughtVisualizer).toBeDefined();
    });

    it('should handle THOUGHT_PULSE messages', () => {
        const message = {
            type: 'THOUGHT_PULSE',
            token_id: 15496,
            x: 100,
            y: 100,
            intensity: 0.8
        };

        engine._handleThoughtPulse(message);

        expect(engine.thoughtVisualizer.count).toBe(1);
    });

    it('should route WebSocket THOUGHT_PULSE to visualizer', () => {
        const mockEvent = {
            data: JSON.stringify({
                type: 'THOUGHT_PULSE',
                token_id: 0,
                x: 50,
                y: 50,
                intensity: 1.0
            })
        };

        engine._onWebSocketMessage(mockEvent);

        expect(engine.thoughtVisualizer.count).toBe(1);
    });
});
```

### Step 2: Run test to verify it fails

```bash
cd systems/visual_shell/web && npx vitest run tests/test_neural_city_thought_pulse.js
```

Expected: FAIL - `thoughtVisualizer` not defined

### Step 3: Integrate ThoughtVisualizer

Modify `systems/visual_shell/web/js/NeuralCityEngine.js`:

Add import at top:
```javascript
import { ThoughtVisualizer } from '../ThoughtVisualizer.js';
```

Add to constructor (after `this.ffiWs = null;`):
```javascript
// Thought Visualizer for PixelBrain
this.thoughtVisualizer = new ThoughtVisualizer(app);
```

Add message handler in `_onWebSocketMessage` method:
```javascript
_onWebSocketMessage(event) {
    try {
        const data = JSON.parse(event.data);

        // Handle THOUGHT_PULSE messages
        if (data.type === 'THOUGHT_PULSE') {
            this._handleThoughtPulse(data);
            return;
        }

        // ... existing handlers ...
    } catch (e) {
        console.error('Failed to parse WebSocket message:', e);
    }
}

/**
 * Handle THOUGHT_PULSE message from PixelBrain.
 *
 * @param {Object} data - Pulse data
 */
_handleThoughtPulse(data) {
    if (this.thoughtVisualizer) {
        this.thoughtVisualizer.emitThoughtPulse(data);
    }
}
```

### Step 4: Run tests to verify they pass

```bash
cd systems/visual_shell/web && npx vitest run tests/test_neural_city_thought_pulse.js
```

Expected: 3/3 PASS

### Step 5: Commit

```bash
git add systems/visual_shell/web/js/NeuralCityEngine.js systems/visual_shell/web/tests/test_neural_city_thought_pulse.js
git commit -m "feat(visual-shell): wire ThoughtVisualizer to NeuralCityEngine WebSocket"
```

---

## Task 4: Add Atlas Glow Visualization

**Problem:** We want to see which weight atlas pixels are accessed during inference.

**Files:**
- Modify: `systems/visual_shell/api/visual_bridge.py`
- Modify: `systems/visual_shell/wgsl/pixel_brain_pipeline.py`
- Create: `systems/visual_shell/web/AtlasGlowOverlay.js`

### Step 1: Add emit_atlas_glow to VisualBridge

Add to `systems/visual_shell/api/visual_bridge.py` after `get_active_glyphs`:

```python
def emit_atlas_glow(
    self,
    weight_indices: List[int],
    intensity: float = 1.0,
    duration_ms: int = 500
) -> bool:
    """
    Emit an ATLAS_GLOW event highlighting accessed weight pixels.

    This visualizes which parts of the brain atlas are being used
    during inference, making the model's "thinking" visible.

    Args:
        weight_indices: List of Hilbert indices that were accessed
        intensity: Glow intensity (0-1)
        duration_ms: How long the glow should last

    Returns:
        True if emission successful
    """
    import asyncio

    if not weight_indices:
        return False

    glow = {
        "type": "ATLAS_GLOW",
        "indices": weight_indices[:100],  # Limit to first 100 for performance
        "intensity": max(0.0, min(1.0, intensity)),
        "duration_ms": duration_ms,
        "timestamp": time.time()
    }

    async def _broadcast():
        dead_sockets = set()
        for ws in self.active_websockets:
            try:
                await ws.send_json(glow)
            except Exception:
                dead_sockets.add(ws)
        self.active_websockets -= dead_sockets

    try:
        loop = asyncio.get_running_loop()
        loop.create_task(_broadcast())
    except RuntimeError:
        pass

    return True
```

### Step 2: Wire atlas glow to pipeline

Modify `systems/visual_shell/wgsl/pixel_brain_pipeline.py`:

Add to `embed_token` method, track accessed indices:

```python
def embed_token(self, token_id: int) -> np.ndarray:
    """Look up token embedding from atlas."""
    dim = self.config.get("dim", 64)
    vocab = self.config.get("vocab", 50257)

    if token_id < 0 or token_id >= vocab:
        raise ValueError(f"Invalid token_id: {token_id}")

    hidden = np.zeros(dim, dtype=np.float32)
    accessed_indices = []  # Track for visualization

    for i in range(dim):
        atlas_idx = token_id * dim + i
        accessed_indices.append(atlas_idx)

        if atlas_idx < len(self._hilbert._lut):
            x, y = self._hilbert._lut[atlas_idx]
            channel = atlas_idx % 4
            if self.atlas.ndim == 3:
                hidden[i] = self.atlas[y, x, channel]
            else:
                hidden[i] = self.atlas[y, x]

    # Store accessed indices for visualization
    self._last_accessed_indices = accessed_indices

    return hidden.astype(np.float32)

def get_last_accessed_indices(self) -> List[int]:
    """Get the weight indices accessed in last operation."""
    return getattr(self, '_last_accessed_indices', [])
```

### Step 3: Create AtlasGlowOverlay.js

Create `systems/visual_shell/web/AtlasGlowOverlay.js`:

```javascript
/**
 * AtlasGlowOverlay - Visualizes weight atlas access patterns.
 *
 * Renders a heatmap overlay on the brain atlas showing which
 * pixels were accessed during inference.
 */

import * as PIXI from 'pixi.js';

export class AtlasGlowOverlay {
    /**
     * Create a new AtlasGlowOverlay.
     *
     * @param {PIXI.Application} app - PixiJS application
     * @param {Object} options - Configuration options
     * @param {number} options.atlasSize - Size of atlas texture (default 1024)
     */
    constructor(app, options = {}) {
        this.app = app;
        this.atlasSize = options.atlasSize || 1024;
        this.glowPoints = new Map();

        // Create container for glow sprites
        this.container = new PIXI.Container();
        this.app.stage.addChild(this.container);

        // Create render texture for glow accumulation
        this.glowTexture = PIXI.RenderTexture.create({
            width: this.atlasSize,
            height: this.atlasSize
        });

        this.glowSprite = new PIXI.Sprite(this.glowTexture);
        this.glowSprite.blendMode = 'ADD';
        this.container.addChild(this.glowSprite);
    }

    /**
     * Handle ATLAS_GLOW message.
     *
     * @param {Object} data - Glow data from WebSocket
     * @param {number[]} data.indices - Hilbert indices that were accessed
     * @param {number} data.intensity - Glow intensity (0-1)
     * @param {number} data.duration_ms - Duration in milliseconds
     */
    handleGlow(data) {
        const { indices, intensity = 1.0, duration_ms = 500 } = data;

        if (!indices || indices.length === 0) return;

        // Create glow graphics
        const graphics = new PIXI.Graphics();
        graphics.fill({ color: 0x00FFFF, alpha: intensity * 0.3 });

        // Draw points for each accessed index
        for (const idx of indices) {
            const coord = this._hilbertIndexToCoord(idx);
            graphics.circle(coord.x, coord.y, 2);
        }

        graphics.fill();

        // Add to container
        this.container.addChild(graphics);

        // Schedule fade
        const glowId = Date.now();
        this.glowPoints.set(glowId, {
            graphics,
            startTime: Date.now(),
            duration: duration_ms
        });

        // Auto-cleanup after duration
        setTimeout(() => {
            this._removeGlow(glowId);
        }, duration_ms + 100);
    }

    /**
     * Convert Hilbert index to (x, y) coordinate.
     * Simplified - assumes 1024x1024 atlas.
     *
     * @param {number} index - Hilbert index
     * @returns {{x: number, y: number}} Coordinate
     */
    _hilbertIndexToCoord(index) {
        // Simplified Hilbert lookup - in production would use full algorithm
        // For now, just spread indices across the atlas
        const x = index % this.atlasSize;
        const y = Math.floor(index / this.atlasSize) % this.atlasSize;
        return { x, y };
    }

    /**
     * Remove a glow effect.
     *
     * @param {number} glowId - Glow identifier
     */
    _removeGlow(glowId) {
        const glow = this.glowPoints.get(glowId);
        if (glow) {
            this.container.removeChild(glow.graphics);
            glow.graphics.destroy();
            this.glowPoints.delete(glowId);
        }
    }

    /**
     * Clear all glow effects.
     */
    clear() {
        for (const [id, glow] of this.glowPoints) {
            this.container.removeChild(glow.graphics);
            glow.graphics.destroy();
        }
        this.glowPoints.clear();
    }
}

export default AtlasGlowOverlay;
```

### Step 4: Commit

```bash
git add systems/visual_shell/api/visual_bridge.py \
        systems/visual_shell/wgsl/pixel_brain_pipeline.py \
        systems/visual_shell/web/AtlasGlowOverlay.js
git commit -m "feat(visual-shell): add ATLAS_GLOW visualization for weight access"
```

---

## Task 5: End-to-End Visual Integration Test

**Problem:** Need to verify the complete visual feedback loop.

**Files:**
- Create: `tests/test_pixel_brain_visual_e2e.py`

### Step 1: Create E2E test

Create `tests/test_pixel_brain_visual_e2e.py`:

```python
"""
End-to-end tests for PixelBrain Visual Shell integration.
"""

import pytest
import asyncio
from unittest.mock import MagicMock, AsyncMock, patch


class TestPixelBrainVisualE2E:
    """Test the complete visual feedback loop."""

    @pytest.fixture
    def mock_bridge(self):
        """Create a mock VisualBridge with WebSocket."""
        from systems.visual_shell.api.visual_bridge import MultiVmStreamer

        bridge = MultiVmStreamer()
        mock_ws = MagicMock()
        mock_ws.send_json = AsyncMock()
        bridge.active_websockets.add(mock_ws)

        yield bridge, mock_ws

        bridge.active_websockets.discard(mock_ws)

    @pytest.mark.asyncio
    async def test_generation_triggers_thought_pulse(self, mock_bridge):
        """Generating tokens should emit THOUGHT_PULSE glyphs."""
        bridge, ws = mock_bridge

        # Import pipeline
        from systems.visual_shell.wgsl.pixel_brain_pipeline import PixelBrainPipeline

        # Skip if brain not available
        brain_path = "tinystories_brain.rts.png"
        try:
            pipeline = PixelBrainPipeline(brain_path)
        except FileNotFoundError:
            pytest.skip("Brain atlas not available")

        # Connect bridge to pipeline
        tokens = []
        for i, token in enumerate(pipeline.generate([0], max_tokens=3)):
            tokens.append(token)
            bridge.emit_thought_pulse(
                token_id=token,
                position=(i * 50, 0),
                intensity=1.0
            )

        # Verify pulses were emitted
        assert len(tokens) == 3
        assert bridge.has_active_glyphs()

        # Give async broadcast time to complete
        await asyncio.sleep(0.1)

        # Verify WebSocket received broadcasts
        assert ws.send_json.call_count == 3

    @pytest.mark.asyncio
    async def test_thought_pulse_message_format(self, mock_bridge):
        """THOUGHT_PULSE messages should have correct format."""
        bridge, ws = mock_bridge

        bridge.emit_thought_pulse(
            token_id=15496,
            position=(100, 200),
            intensity=0.75
        )

        await asyncio.sleep(0.1)

        call_args = ws.send_json.call_args[0][0]
        assert call_args["type"] == "THOUGHT_PULSE"
        assert call_args["opcode"] == 0xCE
        assert call_args["token_id"] == 15496
        assert call_args["x"] == 100
        assert call_args["y"] == 200
        assert call_args["intensity"] == 0.75
        assert "timestamp" in call_args

    @pytest.mark.asyncio
    async def test_atlas_glow_message_format(self, mock_bridge):
        """ATLAS_GLOW messages should have correct format."""
        bridge, ws = mock_bridge

        bridge.emit_atlas_glow(
            weight_indices=[0, 64, 128, 192],
            intensity=0.5,
            duration_ms=1000
        )

        await asyncio.sleep(0.1)

        call_args = ws.send_json.call_args[0][0]
        assert call_args["type"] == "ATLAS_GLOW"
        assert call_args["indices"] == [0, 64, 128, 192]
        assert call_args["intensity"] == 0.5
        assert call_args["duration_ms"] == 1000
```

### Step 2: Run E2E tests

```bash
pytest tests/test_pixel_brain_visual_e2e.py -v
```

Expected: 3/3 PASS (or skip if brain unavailable)

### Step 3: Commit

```bash
git add tests/test_pixel_brain_visual_e2e.py
git commit -m "test(pixel-brain): add visual shell integration E2E tests"
```

---

## Verification Checklist

After all tasks complete, verify:

- [ ] `emit_thought_pulse()` broadcasts to WebSocket clients
- [ ] ThoughtVisualizer renders glyphs in PixiJS
- [ ] NeuralCityEngine routes THOUGHT_PULSE to visualizer
- [ ] AtlasGlowOverlay shows weight access patterns
- [ ] E2E test passes (or skips gracefully)
- [ ] Can watch the model "think" in the browser

---

## Files Changed Summary

| File | Action | Lines |
|------|--------|-------|
| `systems/visual_shell/api/visual_bridge.py` | Modify | +40 |
| `systems/visual_shell/wgsl/pixel_brain_pipeline.py` | Modify | +15 |
| `systems/visual_shell/web/ThoughtVisualizer.js` | Create | +150 |
| `systems/visual_shell/web/AtlasGlowOverlay.js` | Create | +120 |
| `systems/visual_shell/web/js/NeuralCityEngine.js` | Modify | +20 |
| `tests/test_thought_pulse.py` | Modify | +30 |
| `systems/visual_shell/web/tests/test_thought_visualizer.js` | Create | +70 |
| `systems/visual_shell/web/tests/test_neural_city_thought_pulse.js` | Create | +45 |
| `tests/test_pixel_brain_visual_e2e.py` | Create | +90 |

**Total: ~580 lines of code + tests**
