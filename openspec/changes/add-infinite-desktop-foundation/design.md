# Design Impact: Infinite Map Visual Shell

## Geometric Integrity
- **PAS Score**: High. This aligns the visual interface perfectly with the underlying storage topology.
- **Topological Consistency**: The desktop *is* the filesystem.

## Visual Language
- **Infinite Grid**: A continuous 2D plane replacing the concept of "desktop wallpaper".
- **Glassmorphism**: Windows float above the substrate.
- **Semantic Coloring**: Regions of the map colored by data entropy (Code=Cyan, Media=Purple).

## Performance
- **GPU Native**: WGPU usage ensures high frame rates (unlike DOM/Canvas).
- **RTS Optimization**: Only visible regions of the RTS texture need to be decoded/uploaded to VRAM.
