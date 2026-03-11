# Proposal: Enhance Console Visuals

## Context
The current `NeuralConsole` and VM windows rendering uses a basic texture sampling shader (`surface.wgsl`). The aesthetic is functional but lacks the "Geometry OS" polish (Retro-Cyberpunk/Glassmorphism).

## Goal
Upgrade the visual rendering of the Console and VM windows to match the system's "Living Geometry" aesthetic.

## Changes
1.  **Shader Enhancement**: Modify `surface.wgsl` to include CRT-like effects (scanlines, vignette, slight aberration).
2.  **Console Styling**: Update `NeuralConsole` default rendering colors to a neon/cyan palette.
3.  **Visual Alignment**: Ensure textual output feels "integrated" into the substrate rather than floating on top.

## Impact
-   **Visuals**: Significant upgrade to "Game Mode" and VM interactions.
-   **Performance**: Negligible impact (fragment shader complexity increase is minimal).
-   **Code**: Minimal changes to `renderer.rs` and `neural_console.rs`. Only shader and color logic.

## Risk
-   **Readability**: Aggressive CRT effects might reduce text readability. Will prioritize legibility.
