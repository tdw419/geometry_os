# Visual Hotspot Debugger

## Summary

This changeset implements a real-time execution heat map on the Geometry OS Infinite Map.
It visualizes code "temperature" based on memory access patterns from the RISC-V executor, 
FUSE file access, and evolution daemon activity.

## Motivation

Understanding the spatial distribution of execution activity is critical for debugging 
performance bottlenecks and understanding the system's dynamic behavior. The Visual Hotspot 
Debugger provides a 64x64 heat grid overlay that uses a Hilbert-mapped color gradient 
to highlight active regions.

## Architecture

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

## Tech Stack

- **Backend**: Python 3.12+, NumPy (Heat aggregation)
- **Frontend**: JavaScript, PixiJS v8 (Overlay rendering)
- **Communication**: WebSockets via VisualBridge
- **Data Format**: Compact hex-encoded Float32 grids

## Files

| File | Purpose |
|------|---------|
| `systems/visual_shell/api/heat_aggregator.py` | Backend heat aggregation service |
| `systems/visual_shell/api/visual_bridge.py` | VisualBridge integration |
| `systems/infinite_map_rs/src/bin/run_riscv.rs` | RISC-V memory access instrumentation |
| `systems/visual_shell/web/HeatmapOverlay.js` | PixiJS heat overlay renderer |
| `systems/visual_shell/web/application.js` | UI integration and keyboard shortcuts |
| `systems/visual_shell/web/visual_debug_overlay.js` | HUD statistics display |

## Success Criteria

- [ ] Heat map updates in real-time (1 Hz)
- [ ] Color gradient: Blue (cold) → Cyan → Green → Yellow → Red (hot)
- [ ] Toggle via Ctrl+Shift+M
- [ ] Stats visible in Visual Debug Overlay (Ctrl+Shift+V)
- [ ] Unit tests for HeatAggregator pass
- [ ] End-to-end integration verified

## Related

- Implementation Plan: `.planning/visual-hotspot-debugger-plan.md`
