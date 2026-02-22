# Visual & Geometric Design

## Neural HUD "Chromatic Language"
The HUD must overlay the desktop with minimal obstruction (Glassmorphism), using specific colors to denote cognitive state:

1.  **Green (#00FF00)**: **Logic**. Generating/Excuting Python code (Planning).
    *   *Visual*: Scrolling lines of code, matrix-style rain or clean terminal blocks.
2.  **Magenta (#FF00FF)**: **Perception**. inspecting `VISUAL_CONTEXT` or querying state.
    *   *Visual*: Bounding boxes, scanlines, data inspection grids.
3.  **Red (#FF0000)**: **Learning/Error**. Backtracking or low Safety Score.
    *   *Visual*: Glitch effects, red flash, rewriting previous logic.

## "Vectorland" Geometry
- **3D Logic**: Windows and elements are treated as vectors.
- **Simulation Lines**: Before moving a window, draw a dotted "simulation line" showing the trajectory.
- **Safety Indicators**: Display a "Safety Score" (e.g., "0.98") near the action target.

## Rendering
- Use `neural_hud.py` with GPU acceleration (WGPU/OpenGL via Python bindings or communicating with Rust compositor).
- Ensure alpha blending (`Alpha = 0.8` for active thought, `0.2` for idle) to maintain usability.
