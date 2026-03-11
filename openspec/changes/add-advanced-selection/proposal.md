# Proposal: Advanced Terminal Selection (Geometric & Semantic)

## 1. The Why
Currently, the Terminal Emulator accepts basic stream-based selection (click-drag). To elevate the OS from "Symbolic" to "Geometric", the user interaction must feel *tactile* and *aware* of the content structure.
- **Double-Click**: Recognizes "Words" (Semantic units).
- **Triple-Click**: Recognizes "Lines" (Structural units).
- **Alt-Drag (Block)**: Recognizes "Grid" (Geometric units).

This change transforms the terminal text buffer from a mere 1D stream into a manipulatable 2D surface, aligning with the "Visual-First Computation" mandate.

## 2. The What
We will implement a robust input state machine in `TerminalEmulator` to handle:
- **Multi-Click Detection**: Timing-based double/triple click events.
- **Selection Modes**: extending `SelectionMode` to support `Block` (Rectangular) and `Stream`.
- **Word Boundary Logic**: Configurable delimiters for precise word selection.
- **Visual Feedback**: Rendering block selections correctly (not wrapping lines).

## 3. Impact Analysis
- **User Experience**: Drastically improves copy-paste efficiency and feeling of precision.
- **Compatibility**: Block selection is standard in high-end terminals (Alacritty, Kitty).
- **Geometric Integrity**: Treating text as a grid reinforces the "Pixel" nature of the OS.

## 4. Risk Assessment
- **Complexity**: Block selection requires careful handling of line lengths and "empty" cells (virtual whitespace).
- **Performance**: Negligible.
