# Neural City Visualization - Design Document

> **Status:** Approved
> **Date:** 2026-02-18
> **Component:** Visual Shell / Spatial Substrate Interface

## Overview

Neural City is a unified visualization that transforms the Geometry OS infinite map into a living urban landscape. It serves three purposes:
1. **Introspection Tool** - Debug and understand agent internal states
2. **Aesthetic/Emergent Art** - Beautiful visual representation of distributed cognition
3. **Navigation Interface** - Spatial metaphors for interacting with agent systems

## Morphological Contract

### The Central Tectonic Spire
- **Represents:** EvolutionDaemon hub
- **Visual:** Towering central structure
- **Base Glow Color:**
  - Cyan = Healthy (IPC normal)
  - Orange = Degraded (IPC < 10% drop)
  - Red = Tectonic Shift in Progress
- **Height:** Proportional to daemon uptime/generation count

### Districts

| District | Represents | Visual Style |
|----------|------------|--------------|
| **Cognitive** | Area Agents, LLM inference | Crystalline skyscrapers, thinking beams |
| **Metabolic** | MetabolismMonitor, TectonicStage | Industrial processing plants, exhaust vents |
| **Substrate** | PixelRTS, Hilbert mapping | Pixel-grid buildings, data textures |

### Infrastructure (Bridges)
- **Visual:** Kinetic energy arcs between buildings
- **Trigger:** Inter-agent communication (WebMCP/A2A events)
- **Color Coding:**
  - Cyan = System commands
  - Purple = Creative/LLM inference
  - Gold = Evolution events

### Ambient Traffic
- **Visual:** Procedural particle flows between districts
- **Density:** Proportional to aggregate system activity
- **Behavior:** Flocks toward high-activity buildings

## Data Sources

### 1. EvolutionDaemon Telemetry
- Metabolism (IPC, CPU, Memory)
- Tectonic shifts (improvement percentage)
- GuardianGate activity (approvals/rejections)

### 2. Area Agent Swarm
- Active agents count
- Agent roles (CoreCompositor, NeuralCognitive, etc.)
- Inter-agent messages (A2A protocol)

### 3. Infinite Map State
- Tile occupancy density
- Chunk activity levels
- Cursor/focus position

## Technical Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                    NeuralCityEngine.js                      │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  TelemetryBus          CityOrchestrator       PixiJS v8     │
│  ┌──────────┐         ┌──────────────┐      ┌──────────┐   │
│  │WebSocket │────────▶│ Layout Engine│─────▶│RenderGroup│   │
│  │Subscribes│         │ District Mgr │      │ Static    │   │
│  └──────────┘         └──────────────┘      │ Dynamic   │   │
│       │                      │               └──────────┘   │
│       ▼                      ▼                     │         │
│  ┌──────────┐         ┌──────────────┐            │         │
│  │Event Types│        │Building Pool │            │         │
│  │-metabolism│        │ - Districts  │            │         │
│  │-tectonic  │        │ - Bridges    │◀───────────┘         │
│  │-agent_*   │        │ - Particles  │                      │
│  └──────────┘         └──────────────┘                      │
│                                                             │
│  ┌──────────────────────────────────────────────────────┐  │
│  │                   neural_city.wgsl                    │  │
│  │  Compute Shader: Procedural building generation       │  │
│  │  Fragment Shader: Lighting, ambience, glow effects    │  │
│  └──────────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────────┘
```

## Rendering Strategy (Hybrid Adaptive)

### Scale Transitions

| Agent Count | Mode | Technique | Performance |
|-------------|------|-----------|-------------|
| 1-20 | Building-Per-Agent | Full geometry, individual materials | High fidelity |
| 20-100 | District-Per-Subsystem | Grouped buildings, instanced rendering | Balanced |
| 100+ | Procedural Abstract | WGSL compute shader heatmap | Maximum FPS |

### RenderGroup Separation
- **Static Layer:** District geometry, base terrain (updated rarely)
- **Dynamic Layer:** Building luminance, bridges, particles (updated per frame)
- **Overlay Layer:** Glass Box introspection UI (on-demand)

## File Structure

```
systems/visual_shell/web/
├── js/
│   └── NeuralCityEngine.js      # Main controller
├── shaders/
│   └── neural_city.wgsl         # WebGPU procedural shader
└── index.html                   # Integration point
```

## API Contract

### TelemetryBus Events

```javascript
// Subscribe to daemon telemetry
telemetryBus.subscribe('metabolism_update', (data) => {
  // data: { ipc: float, cpu: float, throttle_level: string }
});

telemetryBus.subscribe('tectonic_shift', (data) => {
  // data: { success: bool, improvement_pct: float, generations: int }
});

telemetryBus.subscribe('agent_spawn', (data) => {
  // data: { agent_id: string, role: string, position: {x, y} }
});

telemetryBus.subscribe('agent_comm', (data) => {
  // data: { from: string, to: string, event_type: string }
});
```

### CityOrchestrator Methods

```javascript
// Spawn a new building for an agent
cityOrchestrator.spawnBuilding(agentId, role, metrics);

// Update building state
cityOrchestrator.updateBuilding(agentId, { activity, memory });

// Create bridge arc
cityOrchestrator.createBridge(fromId, toId, eventType);

// Trigger district pulse
cityOrchestrator.pulseDistrict(districtName);
```

## Integration Points

### 1. EvolutionDaemon (Python)
- Broadcast `metabolism_update` via WebMCP every 1s
- Broadcast `tectonic_shift` when TectonicStage completes

### 2. Area Agent System (Python/JS)
- Emit `agent_spawn` when new agent created
- Emit `agent_comm` for A2A messages

### 3. PixiJS Application (JS)
- NeuralCityEngine attaches to existing `GeometryOSApplication`
- Uses same viewport/camera system

## Success Criteria

1. **Visual Fidelity:** City morphology accurately reflects system state
2. **Performance:** 60 FPS with 100+ buildings
3. **Responsiveness:** < 100ms latency from telemetry to visual update
4. **Navigability:** Users can zoom from bird's-eye to street-level introspection

## Future Extensions

- **3D Mode:** WebGL/WebGPU full 3D city rendering
- **Time Travel:** Replay city state from historical snapshots
- **Collaborative:** Multiple users viewing same city instance
