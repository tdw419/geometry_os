# Design: Map Competition Protocol

**Version:** 1.0  
**Status:** DRAFT  
**Last Updated:** 2026-02-06  

---

## System Architecture

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                       MAP COMPETITION ARCHITECTURE                          │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│   ┌─────────────────────────────────────────────────────────────────────┐   │
│   │                         ARBITER DAEMON                              │   │
│   │   - Manages competition cycles                                      │   │
│   │   - Measures territory scores                                       │   │
│   │   - Triggers coronations                                            │   │
│   │   - WebSocket: ws://localhost:9900/arbiter                          │   │
│   └───────────────────────────────┬─────────────────────────────────────┘   │
│                                   │                                         │
│               ┌───────────────────┼───────────────────┐                     │
│               │                   │                   │                     │
│               ▼                   ▼                   ▼                     │
│   ┌───────────────────┐ ┌───────────────────┐ ┌───────────────────┐         │
│   │   CONTENDER A     │ │   CONTENDER B     │ │   CONTENDER C     │         │
│   │   (Current WGPU)  │ │   (PixiJS v8)     │ │   (tldraw)        │         │
│   │                   │ │                   │ │                   │         │
│   │   Territory: 80%  │ │   Territory: 15%  │ │   Territory: 5%   │         │
│   │   FPS: 60         │ │   FPS: 60         │ │   FPS: 30         │         │
│   │   Score: 4800     │ │   Score: 900      │ │   Score: 150      │         │
│   └───────────────────┘ └───────────────────┘ └───────────────────┘         │
│                                   │                                         │
│                                   ▼                                         │
│   ┌─────────────────────────────────────────────────────────────────────┐   │
│   │                    SHARED FRAMEBUFFER                               │   │
│   │   - Composited output from all contenders                           │   │
│   │   - Territory boundaries visualized                                 │   │
│   │   - Winner highlighted                                              │   │
│   └─────────────────────────────────────────────────────────────────────┘   │
│                                   │                                         │
│                                   ▼                                         │
│   ┌─────────────────────────────────────────────────────────────────────┐   │
│   │                  NEURAL EVOLUTION DAEMON                            │   │
│   │   - Studies winning strategies                                      │   │
│   │   - Generates mutant challengers                                    │   │
│   │   - Optimizes for territory expansion                               │   │
│   └─────────────────────────────────────────────────────────────────────┘   │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## API Specification

### 1. Contender Registration

```typescript
// POST /api/arbiter/register
interface ContenderRegistration {
  contender_id: string;          // Unique identifier (e.g., "wgpu-compositor-v1")
  display_name: string;          // Human-readable name
  technology: string;            // "wgpu" | "webgl" | "canvas2d" | "pixijs" | "other"
  
  capabilities: {
    max_extents: [number, number];    // Maximum renderable area [width, height]
    target_fps: number;               // Target frame rate
    pixel_budget: number;             // Max pixels per frame
    supports_infinite: boolean;       // Can render arbitrary coordinates?
    gpu_accelerated: boolean;         // Uses GPU?
  };
  
  render_endpoint: string;       // WebSocket URL for render commands
  health_endpoint: string;       // HTTP URL for health checks
}

// Response
interface RegistrationResponse {
  success: boolean;
  assigned_region: {
    x: number;
    y: number;
    width: number;
    height: number;
  };
  competition_id: string;        // Current competition cycle ID
}
```

### 2. Territory Claim

```typescript
// POST /api/arbiter/claim
interface TerritoryClaim {
  contender_id: string;
  claimed_region: {
    x: number;
    y: number;
    width: number;
    height: number;
  };
  justification: "expansion" | "quality_improvement" | "fps_improvement";
}

// Response
interface ClaimResponse {
  granted: boolean;
  actual_region: {              // May be smaller if conflicts
    x: number;
    y: number;
    width: number;
    height: number;
  };
  conflicts: string[];          // Conflicting contender IDs
}
```

### 3. Render Report

```typescript
// POST /api/arbiter/report (every frame)
interface RenderReport {
  contender_id: string;
  timestamp: number;
  frame_number: number;
  
  metrics: {
    pixels_rendered: number;      // Actual pixels drawn this frame
    render_time_ms: number;       // Time to render
    quality_score: number;        // Self-reported quality (0.0-1.0)
    memory_used_mb: number;       // GPU memory consumption
  };
  
  territory: {
    current_coverage: number;     // Percentage of claimed area being rendered
    expansion_demand: number;     // How much more territory is requested
  };
}
```

### 4. Territory Score Calculation

```python
def calculate_territory_score(contender: Contender) -> float:
    """
    Score = Area × Quality × FPS_Factor × Stability_Bonus
    
    - Area: Total pixels controlled
    - Quality: Render quality (antialiasing, resolution, etc.)
    - FPS_Factor: Normalized frame rate (target: 60fps = 1.0)
    - Stability_Bonus: Multiplier for consistent performance over time
    """
    area = contender.current_pixels
    quality = contender.quality_score  # 0.0-1.0
    fps_factor = min(contender.actual_fps / 60.0, 1.5)  # Cap at 1.5x
    stability = contender.stability_score  # 1.0-1.5 based on variance
    
    return area * quality * fps_factor * stability
```

---

## Coronation Protocol

When a new contender achieves the highest territory score for a sustained period:

```
┌─────────────────────────────────────────────────────────────────────────┐
│                        CORONATION SEQUENCE                              │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│   T+0s:   New leader detected (Score exceeds current substrate by 20%) │
│   T+30s:  Confirmation period begins                                   │
│   T+60s:  If still leading → Transition announced                      │
│                                                                         │
│   TRANSITION ANIMATION:                                                 │
│   - Old substrate fades to 50% opacity (1 second)                      │
│   - New substrate expands from center (2 seconds)                      │
│   - Border glow effect on new substrate (green pulse)                  │
│   - Old substrate shrinks to application window (1 second)             │
│   - Transition complete, new substrate at 100%                         │
│                                                                         │
│   POST-CORONATION:                                                      │
│   - New substrate receives "SUBSTRATE" role                            │
│   - Old substrate demoted to "APPLICATION" role                        │
│   - Neural Evolution notified to study new winner                      │
│   - Competition continues (no resting on laurels)                      │
│                                                                         │
└─────────────────────────────────────────────────────────────────────────┘
```

---

## Initial Contender Pool

| Contender | Technology | Expected Strength | Integration Path |
|-----------|------------|-------------------|------------------|
| **Current WGPU** | Rust/Smithay/WGPU | Native perf, Hilbert | Already integrated |
| **PixiJS v8** | WebGPU/JS | 37M particles, WebSocket | Visual Shell bridge |
| **tldraw** | React/Canvas | UX polish, selection | Embed in iframe → overlay |
| **Leaflet** | Canvas/WebGL | Tile system, plugins | Geographic layer |
| **Three.js Terrain** | WebGL | 3D procedural | Heightmap layer |
| **Evolution-Generated** | WGSL | Unknown! | Neural Evolution creates |

---

## File Structure

```
systems/arbiter/
├── arbiter_daemon.py           # Main competition manager
├── contender_registry.py       # Track registered contenders  
├── territory_calculator.py     # Score computation
├── coronation_handler.py       # Substrate transitions
├── visualizer.py               # Territory boundary rendering
└── evolution_bridge.py         # Interface to Neural Evolution

systems/contenders/
├── wgpu_contender/             # Our current Rust compositor
│   └── contender_adapter.rs    # Adapts compositor to competition API
├── pixijs_contender/           # PixiJS v8 wrapper
│   └── contender.js            # WebSocket-based contender
└── tldraw_contender/           # tldraw wrapper
    └── contender.tsx           # React-based contender
```

---

## Integration with Existing Systems

### 1. Neural Evolution Daemon

```python
# When a new winner is crowned, Evolution learns from it
async def on_coronation(new_substrate: Contender, old_substrate: Contender):
    # Extract winning strategy
    winning_patterns = analyze_render_strategy(new_substrate)
    
    # Generate mutations
    mutations = await evolution_daemon.mutate(
        base=winning_patterns,
        mutation_rate=0.1,
        target="territory_expansion"
    )
    
    # Spawn new contenders
    for mutation in mutations:
        await register_evolved_contender(mutation)
```

### 2. Synaptic Bridge

```python
# User actions become contender commands
async def on_user_pan(delta_x: float, delta_y: float):
    # Broadcast to all contenders
    for contender in active_contenders:
        await contender.send_command({
            "type": "camera_move",
            "delta": [delta_x, delta_y]
        })
```

### 3. RTS Visual Containers

```python
# Contenders can render .rts.png files as territory
async def load_rts_texture(contender: Contender, rts_path: str):
    texture_data = load_rts_png(rts_path)
    territory_claim = {
        "width": texture_data.width,
        "height": texture_data.height,
        "source": "rts",
        "hilbert_coherent": True
    }
    await arbiter.submit_claim(contender.id, territory_claim)
```

---

## Success Metrics

| Metric | Target | Measurement |
|--------|--------|-------------|
| **Active Contenders** | ≥3 always competing | Arbiter registry count |
| **Coronation Events** | ≥1 per week | Event log |
| **Territory Utilization** | ≥95% of viewport | Frame analysis |
| **Transition Smoothness** | No visible flicker | User testing |
| **Evolution Improvement** | +10% score/generation | Evolution metrics |
