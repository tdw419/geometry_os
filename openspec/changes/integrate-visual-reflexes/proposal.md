# Proposal: Integration of Visual Reflexes (Phase 22)

## Summary
Connect the backend `ReflexController` (Phase 21) to the frontend `InfiniteDesktop` (PixiJS) to drive real-time visual effects based on neural state.

## Why
Currently, the OS "feels" (Audio/Input analysis) but doesn't "show" it. The `InfiniteDesktop` is static. By connecting the systems, we create a feedback loop where the user's actions and music directly morph the visual substrate, achieving the "Living OS" goal.

## What Changes

### Backend (`infinite_desktop_server.py`)
- **Integration**: Initialize `PredictiveCortex` within the server.
- **Loop**: In `broadcast_daemon_updates`, also tick the Cortex with dummy sensory data (or real if available) and checking for `actions`.
- **Broadcast**: Send `REFLEX_ACTION` JSON packets to WebSocket clients.

### Frontend (`infinite_desktop_integrated.html`)
- **Shader FX**: Add a custom filter to the `world` container (Chromatic Aberration, Bloom, Warp).
- **Reflex Handler**:
    - `audio_pulse` -> Trigger `shockwave` uniform and `color_bloom`.
    - `input_focus` -> Trigger `focus_zoom` and `aberration_reduction`.
    - `void_stare` -> Trigger `drift_wobble`.

## Visual Design
- **Pulse**: A rhythmic expansion of the grid lines (Thickness/Brightness).
- **Focus**: "Tunnel Vision" effect - edges darken, center sharpens.
- **Startle**: Sudden "Glitch" or "Shift" in RGB channels.
