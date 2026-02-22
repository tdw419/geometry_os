# Visual Design: Geometric Selection

## Morphological Shift
Selection is the primary way the user "claims" data from the void. It should feel energetic.

### 1. Selection Visuals
Instead of a simple color inversion:
- **Background**: `rgba(0, 255, 255, 0.4)` (Cyan Neon, 40% opacity).
- **Text**: `Black` (High contrast) or `White` (if background is dark enough).
- **Geometry**: The selection shape for Block Selection must be a precise rectangle, ignoring line wrap logic.

### 2. Micro-Animations
- **Snap**: When a double-click expands to a word, the selection should appear to "snap" to the delimiters instantly.
- **Drag**: Fluid updates at 60fps+.

### 3. PAS (Phase Alignment Stability) Impact
- **Score change**: 0.0
- **Reasoning**: This is a transient UI state; no persistent structural load.

## Structural Logic

### Block Selection (Alt-Drag)
Unlike stream selection, Block Selection operates on `(col, row)` coordinates directly.
```
Start: (5, 10)
End:   (10, 15)
Selection = [Row 10..=15].map(|r| r.cells[5..=10])
```
Visualizing this requires the renderer to ignore "logical line" wrapping for the selection quad.

### Word Selection (Double-Click)
Delimiters: ` ` (space), `\t`, `\n`, brackets `[]`, `()`, `{}`, quotes `'`, `"`.
The selection automatically expands to the nearest delimiters on `MousePress` (2 clicks).
