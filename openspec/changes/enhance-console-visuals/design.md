# Design: Console Visual Enhancements

## Visual Philosophy
"The UI is the Computer." The console is not just a terminal; it's a direct view into the Neural Substrate's thought process.

## Geometric Principles
-   **Grid Alignment**: Text lines should feel aligned to the underlying fractal grid.
-   **Analog Warmth**: The "PixelRTS" aesthetic implies an analog-digital hybrid. Scanlines and "phosphor decay" simulation (via color persistence or just color choice) align with this.

## Implementation Details

### Shader (`surface.wgsl`)
Implement a "CRT Shader" effect:
-   **Scanlines**: `sin(uv.y * resolution)`.
-   **Vignette**: Darken corners.
-   **Curvature**: (Optional/Low) Lens distortion.

### Colors (`neural_console.rs` / `terminal_emulator.rs`)
-   **Background**: Instead of pure black (`#000000`), use Deep Void Blue (`#050A10`) or Transparent.
-   **Foreground**: Neon Cyan (`#00FFDD`) or Amber (`#FFB000`).
-   **Selection**: Inverse or Glitch effect.

### Structural Health
-   **PAS Impact**: Neutral. Shader ALUs increase slightly but bandwidth remains same.
-   **Resolution**: 1080p+ recommended for scanlines to look good.

## Mockup
(Mental Simulation)
> A dark, glass-like pane floating in the infinite grid. Text glows slightly. Subtle horizontal lines drift down. The cursor pulses like a heartbeat.
