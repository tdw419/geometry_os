# Agent Team: Visual Hotspot Debugger

## Team Composition

- **Backend Engineer (Python)**: Focuses on `heat_aggregator.py` and `visual_bridge.py`.
- **Frontend Architect (JS/PixiJS)**: Focuses on `HeatmapOverlay.js` and UI integration.
- **Systems Engineer (Rust)**: Focuses on `run_riscv.rs` instrumentation.
- **QA Automation**: Focuses on `pytest` and E2E verification.

## Workflow

1. **Backend Foundation**: Implement Task 1.1 and 1.2 first.
2. **Frontend Skeleton**: Implement Task 2.1 and 2.2 with mock data.
3. **Hardware Bridge**: Implement Task 1.3 to connect real data.
4. **Polishing**: Implement Task 2.3 and refine visuals.
5. **Verification**: Run all tests in Phase 3.

## Communication

- Use `heat_map_update` WebSocket message as the primary interface.
- Grid size is fixed at 64x64 for performance.
