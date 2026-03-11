## Backend
- [x] Update `infinite_desktop_server.py` to import `PredictiveCortex`.
- [x] Implement `CortexBridge` class to run the sensory loop.
- [x] Wire `processed_state['actions']` to WebSocket `REFLEX_ACTION` broadcast.

## Frontend (PixiJS)
- [x] Create `VisualCortex` JS class in `infinite_desktop_integrated.html`.
- [x] Implement basic PixiJS Filters (Custom fragment shaders).
    - `ShockwaveFilter`
    - `GlitchFilter`
    - `BloomFilter`
- [x] Handle `REFLEX_ACTION` messages to tween filter uniforms.

## Validation
- [x] Run `sense_monitor.py` alongside and verify browser responds to beats.
