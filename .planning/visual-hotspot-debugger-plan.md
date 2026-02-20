# Visual Hotspot Debugger - Implementation Plan

> **Goal**: Real-time execution heat map showing code "temperature" on the Infinite Map
>
> **Activation**: Ctrl+Shift+M (toggle) or auto-show during RISC-V execution
>
> **Visual**: Blue (cold) → Cyan → Green → Yellow → Red (hot)

---

## Architecture Overview

```
┌─────────────────────────────────────────────────────────────────────────┐
│                           DATA FLOW                                      │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                          │
│  RISC-V Executor ──┐                                                    │
│  FUSE File Access ─┼──► HeatAggregator ──► Visual Bridge ──► Browser   │
│  Evolution Daemon ─┘        │                  │             │          │
│                              │                  │             ▼          │
│                              ▼                  │      HeatmapOverlay   │
│                        .geometry/heat/         │       (PixiJS)         │
│                          heat_state.json       │                         │
│                                              WS:8768                    │
│                                           heat_map_update               │
└─────────────────────────────────────────────────────────────────────────┘
```

---

## Task Breakdown

### Phase 1: Backend Heat Aggregation (Python)

#### Task 1.1: Create HeatAggregator Service
**File**: `systems/visual_shell/api/heat_aggregator.py`

```python
"""
HeatAggregator - Collects access patterns and computes spatial heat map.

Integrates with:
- RISC-V GPU executor (memory access patterns)
- FUSE filesystem (file read/write events)
- Evolution daemon (mutation hotspots)
- Spatial Tectonics (rebalancing triggers)
"""

import asyncio
import json
import time
from pathlib import Path
from dataclasses import dataclass, field
from typing import Dict, List, Optional, Tuple
import numpy as np

from .vat_manager import VATManager
from .visual_bridge import VisualBridge

GRID_SIZE = 64  # 64x64 heat grid
DECAY_RATE = 0.95  # Per-second decay
HEAT_INCREMENT = 0.1  # Per-access increment
PERSISTENCE_PATH = Path(".geometry/heat/heat_state.json")


@dataclass
class HeatCell:
    """Single cell in the heat grid."""
    value: float = 0.0
    access_count: int = 0
    last_access: float = 0.0
    sources: Dict[str, float] = field(default_factory=dict)  # source -> contribution


@dataclass
class HeatMap:
    """64x64 heat map with diffusion and decay."""
    grid: np.ndarray = field(default_factory=lambda: np.zeros((GRID_SIZE, GRID_SIZE), dtype=np.float32))
    last_update: float = field(default_factory=time.time)

    def apply_decay(self, dt: float):
        """Apply temporal decay to all cells."""
        decay_factor = DECAY_RATE ** dt
        self.grid *= decay_factor

    def add_heat(self, x: int, y: int, amount: float, source: str = "unknown"):
        """Add heat at specific coordinates."""
        if 0 <= x < GRID_SIZE and 0 <= y < GRID_SIZE:
            self.grid[y, x] = min(1.0, self.grid[y, x] + amount)

    def diffuse(self, iterations: int = 1):
        """Apply heat diffusion (blur) for smooth visualization."""
        kernel = np.array([[0.05, 0.1, 0.05],
                          [0.1,  0.4, 0.1],
                          [0.05, 0.1, 0.05]], dtype=np.float32)

        for _ in range(iterations):
            padded = np.pad(self.grid, 1, mode='edge')
            self.grid = np.zeros_like(self.grid)
            for dy in range(3):
                for dx in range(3):
                    self.grid += padded[dy:dy+GRID_SIZE, dx:dx+GRID_SIZE] * kernel[dy, dx]

    def get_hotspots(self, threshold: float = 0.7) -> List[Tuple[int, int, float]]:
        """Return cells above threshold."""
        hotspots = []
        for y in range(GRID_SIZE):
            for x in range(GRID_SIZE):
                if self.grid[y, x] >= threshold:
                    hotspots.append((x, y, float(self.grid[y, x])))
        return sorted(hotspots, key=lambda h: h[2], reverse=True)


class HeatAggregator:
    """Central heat map aggregator with WebSocket broadcast."""

    def __init__(self, bridge: VisualBridge, vat_manager: VATManager):
        self.bridge = bridge
        self.vat_manager = vat_manager
        self.heat_map = HeatMap()
        self._running = False
        self._task: Optional[asyncio.Task] = None

        # Load persisted state
        self._load_state()

    def _load_state(self):
        """Load persisted heat state from disk."""
        if PERSISTENCE_PATH.exists():
            try:
                data = json.loads(PERSISTENCE_PATH.read_text())
                self.heat_map.grid = np.array(data["grid"], dtype=np.float32)
                self.heat_map.last_update = data.get("last_update", time.time())
            except Exception as e:
                print(f"[HeatAggregator] Failed to load state: {e}")

    def _save_state(self):
        """Persist heat state to disk."""
        PERSISTENCE_PATH.parent.mkdir(parents=True, exist_ok=True)
        data = {
            "grid": self.heat_map.grid.tolist(),
            "last_update": self.heat_map.last_update
        }
        PERSISTENCE_PATH.write_text(json.dumps(data))

    async def start(self):
        """Start the heat aggregation loop."""
        self._running = True
        self._task = asyncio.create_task(self._update_loop())
        print("[HeatAggregator] Started")

    async def stop(self):
        """Stop aggregation and persist state."""
        self._running = False
        if self._task:
            self._task.cancel()
        self._save_state()
        print("[HeatAggregator] Stopped")

    async def _update_loop(self):
        """Periodic update: decay, diffuse, broadcast."""
        while self._running:
            now = time.time()
            dt = now - self.heat_map.last_update

            # Apply decay
            self.heat_map.apply_decay(dt)

            # Diffuse for smooth visualization
            self.heat_map.diffuse(iterations=1)

            # Broadcast update
            await self._broadcast_update()

            self.heat_map.last_update = now

            # Persist every 30 seconds
            if int(now) % 30 == 0:
                self._save_state()

            await asyncio.sleep(1.0)  # 1 Hz update rate

    async def _broadcast_update(self):
        """Broadcast heat map to connected clients."""
        hotspots = self.heat_map.get_hotspots()

        message = {
            "type": "heat_map_update",
            "data": {
                "grid": self.heat_map.grid.tobytes().hex(),  # Compact encoding
                "grid_shape": [GRID_SIZE, GRID_SIZE],
                "timestamp": time.time(),
                "hotspots": [{"x": x, "y": y, "intensity": i} for x, y, i in hotspots[:10]]
            }
        }

        await self.bridge.broadcast(message)

    def record_access(self, hilbert_x: int, hilbert_y: int, source: str = "unknown"):
        """Record an access event at the given Hilbert coordinates."""
        # Map to grid coordinates (assuming larger Hilbert space)
        grid_x = hilbert_x % GRID_SIZE
        grid_y = hilbert_y % GRID_SIZE

        self.heat_map.add_heat(grid_x, grid_y, HEAT_INCREMENT, source)

    def record_memory_access(self, address: int, source: str = "riscv"):
        """Record a memory access by linear address (converted via Hilbert)."""
        from ..web.hilbert_lut import d2xy  # Import from JS equivalent

        # Simple linear-to-grid mapping for now
        grid_x = (address // 4) % GRID_SIZE
        grid_y = (address // 4) // GRID_SIZE % GRID_SIZE

        self.heat_map.add_heat(grid_x, grid_y, HEAT_INCREMENT, source)

    def get_heat_at(self, x: int, y: int) -> float:
        """Get current heat value at coordinates."""
        if 0 <= x < GRID_SIZE and 0 <= y < GRID_SIZE:
            return float(self.heat_map.grid[y, x])
        return 0.0
```

**Test Command**:
```bash
pytest tests/test_heat_aggregator.py -v
```

**Verification**:
- Heat map grid starts at zero
- `record_access()` increments heat
- Decay reduces heat over time
- Diffusion smooths heat distribution

---

#### Task 1.2: Integrate with Visual Bridge
**File**: `systems/visual_shell/api/visual_bridge.py` (modify)

Add `heat_map_update` handler registration:

```python
# In VisualBridge.__init__():
self.heat_aggregator: Optional[HeatAggregator] = None

# Add method:
async def start_heat_aggregator(self, vat_manager: VATManager):
    """Start the heat aggregation service."""
    from .heat_aggregator import HeatAggregator
    self.heat_aggregator = HeatAggregator(self, vat_manager)
    await self.heat_aggregator.start()

async def stop_heat_aggregator(self):
    """Stop the heat aggregation service."""
    if self.heat_aggregator:
        await self.heat_aggregator.stop()
```

---

#### Task 1.3: Integrate with RISC-V Executor
**File**: `systems/infinite_map_rs/src/bin/run_riscv.rs` (modify)

Add heat tracking on memory access:

```rust
// In memory_store_u8/u16 and memory_load functions:
// After successful access, send WebSocket message

fn record_heat_access(x: usize, y: usize, access_type: &str) {
    let message = serde_json::json!({
        "type": "heat_access",
        "data": {
            "x": x,
            "y": y,
            "access_type": access_type,
            "timestamp": SystemTime::now().duration_since(UNIX_EPOCH).unwrap().as_millis()
        }
    });

    // Send to Visual Bridge via WebSocket
    if let Some(tx) = &ws_tx {
        let _ = tx.send(Message::Text(message.to_string()));
    }
}
```

---

### Phase 2: Frontend Heat Overlay (JavaScript)

#### Task 2.1: Create HeatmapOverlay Renderer
**File**: `systems/visual_shell/web/HeatmapOverlay.js`

```javascript
/**
 * HeatmapOverlay - Real-time heat map visualization for the Infinite Map.
 *
 * Features:
 * - Color gradient: Blue (cold) → Cyan → Green → Yellow → Red (hot)
 * - Semi-transparent overlay on Hilbert grid
 * - Animated pulse for hotspots
 * - Toggle with Ctrl+Shift+M
 */

import { HeatmapGraphicsPool } from './heatmap_graphics_pool.js';

const GRID_SIZE = 64;
const CELL_SIZE = 16; // Pixels per heat cell

// Color gradient lookup
const HEAT_COLORS = [
    { r: 0, g: 0, b: 255, a: 0.1 },    // Cold (blue, transparent)
    { r: 0, g: 255, b: 255, a: 0.3 },  // Cool (cyan)
    { r: 0, g: 255, b: 0, a: 0.5 },    // Warm (green)
    { r: 255, g: 255, b: 0, a: 0.7 },  // Hot (yellow)
    { r: 255, g: 0, b: 0, a: 0.9 },    // Very hot (red)
];

export class HeatmapOverlay {
    constructor(app, viewport, worldContainer) {
        this.app = app;
        this.viewport = viewport;
        this.worldContainer = worldContainer;

        // Heat data
        this.grid = new Float32Array(GRID_SIZE * GRID_SIZE);
        this.hotspots = [];

        // Graphics
        this.container = new PIXI.Container();
        this.container.alpha = 0.7;
        this.container.visible = false;

        // Graphics pool for efficient rendering
        this.graphicsPool = new HeatmapGraphicsPool(100);

        // Animation state
        this.pulsePhase = 0;
        this.lastUpdate = 0;

        worldContainer.addChild(this.container);

        // Bind WebSocket handler
        this._setupWebSocketHandler();
    }

    _setupWebSocketHandler() {
        if (window.visualBridge) {
            window.visualBridge.on('heat_map_update', (data) => {
                this.updateHeatMap(data);
            });
        }
    }

    /**
     * Update heat map from WebSocket data.
     */
    updateHeatMap(data) {
        // Decode hex-encoded grid
        if (data.grid) {
            const bytes = new Uint8Array(
                data.grid.match(/.{2}/g).map(b => parseInt(b, 16))
            );
            this.grid = new Float32Array(bytes.buffer);
        }

        this.hotspots = data.hotspots || [];
        this.lastUpdate = data.timestamp || Date.now();

        this._render();
    }

    /**
     * Get interpolated color for heat value (0.0 - 1.0).
     */
    _getColorForHeat(value) {
        if (value <= 0) return HEAT_COLORS[0];
        if (value >= 1) return HEAT_COLORS[4];

        const scaled = value * (HEAT_COLORS.length - 1);
        const index = Math.floor(scaled);
        const t = scaled - index;

        const c1 = HEAT_COLORS[index];
        const c2 = HEAT_COLORS[Math.min(index + 1, HEAT_COLORS.length - 1)];

        return {
            r: Math.round(c1.r + (c2.r - c1.r) * t),
            g: Math.round(c1.g + (c2.g - c1.g) * t),
            b: Math.round(c1.b + (c2.b - c1.b) * t),
            a: c1.a + (c2.a - c1.a) * t
        };
    }

    /**
     * Render the heat map overlay.
     */
    _render() {
        // Clear previous graphics
        this.container.removeChildren();
        this.graphicsPool.releaseAll();

        // Render grid cells with heat > threshold
        const threshold = 0.05;

        for (let y = 0; y < GRID_SIZE; y++) {
            for (let x = 0; x < GRID_SIZE; x++) {
                const heat = this.grid[y * GRID_SIZE + x];

                if (heat > threshold) {
                    const color = this._getColorForHeat(heat);
                    const graphics = this.graphicsPool.acquire();

                    graphics.clear();
                    graphics.beginFill(
                        (color.r << 16) | (color.g << 8) | color.b,
                        color.a
                    );

                    // Draw cell
                    graphics.drawRect(
                        x * CELL_SIZE,
                        y * CELL_SIZE,
                        CELL_SIZE,
                        CELL_SIZE
                    );
                    graphics.endFill();

                    this.container.addChild(graphics);
                }
            }
        }

        // Render hotspots with pulse effect
        for (const hotspot of this.hotspots) {
            this._renderHotspot(hotspot);
        }
    }

    /**
     * Render a pulsing hotspot indicator.
     */
    _renderHotspot(hotspot) {
        const graphics = this.graphicsPool.acquire();
        const x = hotspot.x * CELL_SIZE + CELL_SIZE / 2;
        const y = hotspot.y * CELL_SIZE + CELL_SIZE / 2;

        // Pulsing circle
        const pulseScale = 1 + 0.3 * Math.sin(this.pulsePhase);
        const radius = CELL_SIZE * pulseScale;

        graphics.clear();
        graphics.lineStyle(2, 0xffffff, 0.8);
        graphics.beginFill(0xff0000, 0.3);
        graphics.drawCircle(x, y, radius);
        graphics.endFill();

        this.container.addChild(graphics);
    }

    /**
     * Animation tick (called from main loop).
     */
    tick(delta) {
        this.pulsePhase += delta * 0.1;

        // Re-render hotspots for pulse effect
        if (this.container.visible && this.hotspots.length > 0) {
            this._render();
        }
    }

    /**
     * Toggle visibility.
     */
    toggle() {
        this.container.visible = !this.container.visible;
        return this.container.visible;
    }

    /**
     * Set visibility.
     */
    setVisible(visible) {
        this.container.visible = visible;
    }

    /**
     * Get heat at specific world coordinates.
     */
    getHeatAt(worldX, worldY) {
        const gridX = Math.floor(worldX / CELL_SIZE) % GRID_SIZE;
        const gridY = Math.floor(worldY / CELL_SIZE) % GRID_SIZE;

        if (gridX >= 0 && gridX < GRID_SIZE && gridY >= 0 && gridY < GRID_SIZE) {
            return this.grid[gridY * GRID_SIZE + gridX];
        }
        return 0;
    }

    /**
     * Debug: Generate test heat pattern.
     */
    debugTest() {
        // Create a gradient pattern
        for (let y = 0; y < GRID_SIZE; y++) {
            for (let x = 0; x < GRID_SIZE; x++) {
                const cx = GRID_SIZE / 2;
                const cy = GRID_SIZE / 2;
                const dist = Math.sqrt((x - cx) ** 2 + (y - cy) ** 2);
                const maxDist = Math.sqrt(cx ** 2 + cy ** 2);

                this.grid[y * GRID_SIZE + x] = Math.max(0, 1 - dist / maxDist);
            }
        }

        this.hotspots = [
            { x: 32, y: 32, intensity: 1.0 },
            { x: 16, y: 16, intensity: 0.8 },
            { x: 48, y: 48, intensity: 0.7 }
        ];

        this._render();
        this.container.visible = true;

        console.log('[HeatmapOverlay] Debug test activated');
    }
}
```

---

#### Task 2.2: Integrate with Main Application
**File**: `systems/visual_shell/web/application.js` (modify)

```javascript
// In imports:
import { HeatmapOverlay } from './HeatmapOverlay.js';

// In GeometryOSApplication constructor:
this.heatmapOverlay = new HeatmapOverlay(this.app, this.viewport, this.worldContainer);

// In tick loop:
this.heatmapOverlay.tick(delta);

// Add keyboard handler:
_setupKeyboardShortcuts() {
    // ... existing shortcuts ...

    // Ctrl+Shift+M: Toggle Heat Map
    window.addEventListener('keydown', (e) => {
        if (e.ctrlKey && e.shiftKey && e.key === 'M') {
            e.preventDefault();
            const visible = this.heatmapOverlay.toggle();
            console.log(`[HeatmapOverlay] ${visible ? 'Enabled' : 'Disabled'}`);
        }
    });
}

// Debug console access:
window.geometryOSApp.heatmapOverlay.debugTest();
```

---

#### Task 2.3: Add HUD Section to Visual Debug Overlay
**File**: `systems/visual_shell/web/visual_debug_overlay.js` (modify)

```javascript
// Add renderHeatmapSection method:
_renderHeatmapSection(ctx, x, y, width) {
    const heatmap = window.geometryOSApp?.heatmapOverlay;
    if (!heatmap) return 0;

    const lineHeight = 18;
    let currentY = y;

    // Header
    ctx.fillStyle = '#ff6600';
    ctx.font = 'bold 14px monospace';
    ctx.fillText('🔥 HEAT MAP', x, currentY);
    currentY += lineHeight + 4;

    // Stats
    ctx.fillStyle = '#aaa';
    ctx.font = '12px monospace';

    const visible = heatmap.container.visible ? 'ON' : 'OFF';
    const hotspotCount = heatmap.hotspots.length;
    const avgHeat = heatmap.grid.reduce((a, b) => a + b, 0) / heatmap.grid.length;

    ctx.fillText(`Visible: ${visible}`, x + 10, currentY);
    currentY += lineHeight;

    ctx.fillText(`Hotspots: ${hotspotCount}`, x + 10, currentY);
    currentY += lineHeight;

    ctx.fillText(`Avg Heat: ${(avgHeat * 100).toFixed(1)}%`, x + 10, currentY);
    currentY += lineHeight;

    // Color gradient legend
    ctx.fillText('Legend:', x + 10, currentY);
    currentY += lineHeight;

    const legendY = currentY;
    const legendWidth = width - 40;
    for (let i = 0; i < legendWidth; i++) {
        const t = i / legendWidth;
        const color = heatmap._getColorForHeat(t);
        ctx.fillStyle = `rgba(${color.r},${color.g},${color.b},${color.a})`;
        ctx.fillRect(x + 10 + i, legendY, 1, 10);
    }
    currentY += 20;

    return currentY - y + 10;
}
```

---

### Phase 3: Integration & Testing

#### Task 3.1: Write Unit Tests
**File**: `tests/test_heat_aggregator.py`

```python
import pytest
import asyncio
import numpy as np
from systems.visual_shell.api.heat_aggregator import HeatAggregator, HeatMap, GRID_SIZE


class TestHeatMap:
    def test_initial_state(self):
        """Heat map starts at zero."""
        hm = HeatMap()
        assert hm.grid.shape == (GRID_SIZE, GRID_SIZE)
        assert np.all(hm.grid == 0)

    def test_add_heat(self):
        """Adding heat increments cell value."""
        hm = HeatMap()
        hm.add_heat(10, 20, 0.5)
        assert hm.grid[20, 10] == 0.5

    def test_heat_clamped_to_one(self):
        """Heat values are clamped to 1.0."""
        hm = HeatMap()
        hm.add_heat(10, 20, 2.0)  # Over-max
        assert hm.grid[20, 10] == 1.0

    def test_decay(self):
        """Decay reduces heat over time."""
        hm = HeatMap()
        hm.add_heat(10, 20, 1.0)
        hm.apply_decay(1.0)  # 1 second
        assert hm.grid[20, 10] < 1.0
        assert hm.grid[20, 10] > 0

    def test_diffusion(self):
        """Diffusion spreads heat to neighbors."""
        hm = HeatMap()
        hm.add_heat(32, 32, 1.0)
        hm.diffuse(iterations=1)

        # Center should be reduced
        assert hm.grid[32, 32] < 1.0
        # Neighbors should have heat
        assert hm.grid[31, 32] > 0
        assert hm.grid[33, 32] > 0

    def test_get_hotspots(self):
        """Hotspots returns cells above threshold."""
        hm = HeatMap()
        hm.add_heat(10, 10, 0.8)
        hm.add_heat(20, 20, 0.9)
        hm.add_heat(30, 30, 0.3)  # Below threshold

        hotspots = hm.get_hotspots(threshold=0.5)
        assert len(hotspots) == 2
        assert (20, 20, 0.9) in hotspots

    def test_out_of_bounds_ignored(self):
        """Out of bounds coordinates are ignored."""
        hm = HeatMap()
        hm.add_heat(-1, 0, 1.0)  # Should be ignored
        hm.add_heat(GRID_SIZE, 0, 1.0)  # Should be ignored
        assert np.all(hm.grid == 0)


class TestHeatAggregator:
    @pytest.fixture
    def aggregator(self):
        """Create aggregator with mock dependencies."""
        from unittest.mock import MagicMock

        bridge = MagicMock()
        bridge.broadcast = MagicMock(return_value=asyncio.coroutine(lambda: None))

        vat_manager = MagicMock()

        return HeatAggregator(bridge, vat_manager)

    def test_record_access(self, aggregator):
        """Record access adds heat at coordinates."""
        aggregator.record_access(10, 20, "test")
        assert aggregator.heat_map.grid[20, 10] > 0

    def test_record_memory_access(self, aggregator):
        """Record memory access maps linear address to grid."""
        aggregator.record_memory_access(0, "riscv")  # First byte
        assert aggregator.heat_map.grid[0, 0] > 0

    def test_get_heat_at(self, aggregator):
        """Get heat at coordinates returns current value."""
        aggregator.record_access(10, 20, "test")
        heat = aggregator.get_heat_at(10, 20)
        assert heat > 0

    def test_get_heat_at_out_of_bounds(self, aggregator):
        """Out of bounds returns 0."""
        assert aggregator.get_heat_at(-1, 0) == 0
        assert aggregator.get_heat_at(GRID_SIZE, 0) == 0

    @pytest.mark.asyncio
    async def test_update_loop_broadcasts(self, aggregator):
        """Update loop broadcasts heat map."""
        aggregator.record_access(10, 10, "test")

        # Run one iteration
        await aggregator._broadcast_update()

        # Check broadcast was called
        aggregator.bridge.broadcast.assert_called_once()
        call_args = aggregator.bridge.broadcast.call_args[0][0]
        assert call_args["type"] == "heat_map_update"
        assert "grid" in call_args["data"]
        assert "hotspots" in call_args["data"]
```

**Run Tests**:
```bash
pytest tests/test_heat_aggregator.py -v
```

---

#### Task 3.2: End-to-End Integration Test
**File**: `tests/test_heatmap_e2e.py`

```python
"""
End-to-end test for Heat Map visualization.

1. Start Visual Bridge with Heat Aggregator
2. Record simulated access patterns
3. Verify WebSocket broadcast
4. Verify frontend rendering (via debug API)
"""

import pytest
import asyncio
import json
import websockets


@pytest.mark.asyncio
async def test_heatmap_e2e():
    """Test full heat map pipeline."""
    from systems.visual_shell.api.visual_bridge import VisualBridge
    from systems.visual_shell.api.vat_manager import VATManager

    # Start services
    vat_manager = VATManager()
    bridge = VisualBridge()
    await bridge.start_heat_aggregator(vat_manager)

    # Connect as WebSocket client
    async with websockets.connect("ws://localhost:8768") as ws:
        # Record some access patterns
        for i in range(10):
            bridge.heat_aggregator.record_access(i * 5, i * 5, "test")

        # Wait for broadcast
        message = await asyncio.wait_for(ws.recv(), timeout=5.0)
        data = json.loads(message)

        assert data["type"] == "heat_map_update"
        assert len(data["data"]["hotspots"]) > 0

    await bridge.stop_heat_aggregator()
```

---

#### Task 3.3: Manual Verification Checklist

```bash
# 1. Start the Visual Bridge
python3 systems/visual_shell/api/visual_bridge.py &

# 2. Start the Infinite Map (browser)
# Navigate to http://localhost:8080

# 3. Open browser console and run:
window.geometryOSApp.heatmapOverlay.debugTest();

# 4. Toggle with Ctrl+Shift+M
# Expected: Heat overlay appears with gradient pattern

# 5. Run RISC-V program to generate real access patterns
cd systems/infinite_map_rs
cargo run --release --bin run_riscv -- ../riscv_gpu/tests/simple_uart.rts.png

# 6. Observe heat map updates in real-time
# Expected: Heat appears near accessed memory regions

# 7. Check HUD (Ctrl+Shift+V)
# Expected: "🔥 HEAT MAP" section shows stats
```

---

## File Summary

| File | Action | Purpose |
|------|--------|---------|
| `systems/visual_shell/api/heat_aggregator.py` | CREATE | Backend heat aggregation service |
| `systems/visual_shell/api/visual_bridge.py` | MODIFY | Add heat aggregator integration |
| `systems/infinite_map_rs/src/bin/run_riscv.rs` | MODIFY | Record heat on memory access |
| `systems/visual_shell/web/HeatmapOverlay.js` | CREATE | Frontend heat overlay renderer |
| `systems/visual_shell/web/application.js` | MODIFY | Integrate HeatmapOverlay |
| `systems/visual_shell/web/visual_debug_overlay.js` | MODIFY | Add HUD section |
| `tests/test_heat_aggregator.py` | CREATE | Unit tests for HeatAggregator |
| `tests/test_heatmap_e2e.py` | CREATE | End-to-end integration test |

---

## Success Criteria

1. ✅ Heat map updates in real-time (1 Hz)
2. ✅ Color gradient from blue (cold) to red (hot)
3. ✅ Toggle with Ctrl+Shift+M
4. ✅ HUD section shows stats in Visual Debug Overlay
5. ✅ RISC-V execution generates heat at accessed memory regions
6. ✅ Heat decays over time (configurable rate)
7. ✅ Diffusion creates smooth visualization
8. ✅ All unit tests pass
9. ✅ End-to-end test passes
10. ✅ Debug test (`window.geometryOSApp.heatmapOverlay.debugTest()`) shows gradient pattern

---

## Future Enhancements (Out of Scope)

- [ ] Heat map persistence across sessions
- [ ] Historical playback (rewind heat map)
- [ ] Per-source heat maps (RISC-V vs FUSE vs Evolution)
- [ ] Heat-triggered actions (e.g., trigger tectonic realignment when heat exceeds threshold)
- [ ] GPU compute shader for heat diffusion (currently CPU)
