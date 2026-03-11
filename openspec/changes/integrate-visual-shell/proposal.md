# Proposal: Integrate Visual Shell into Compositor

## Context
Phase 15 completed the `visual_shell` crate, providing a neural-to-visual pipeline. Phase 16 aims to integrate this into the main `infinite_map_rs` compositor to realize "The UI is the Computer" vision.

## Goal
Connect the `visual_shell` crate to `infinite_map_rs`, allowing the compositor to:
1. Initialize the Visual Shell with shared GPU resources.
2. Drive the Visual Shell's state via the Evolution Manager.
3. Render the Visual Shell's output texture as a HUD or Background layer.

## Impact
- **Architecture**: Adds `visual_shell` dependency to compositor.
- **Visuals**: Replaces/Augments the static grid background with dynamic neural visualizations.
- **Performance**: Adds texture generation overhead; mitigation via asynchronous updates (already handled in Visual Shell).

## Plan
1. Add dependency.
2. Extend `InfiniteMapApp` to hold `VisualShellIntegration`.
3. Wire up `EvolutionManager` → `VisualShellIntegration`.
4. Expose `VisualShell` texture to `Renderer`.
