# Proposal: Neural Console (Native CLI)

## Context
Geometry OS requires a standardized command-line interface (CLI) to interact with its "Neural" kernel state. Currently, we have a guest VM terminal, but no native shell for the OS itself.

## Change Description
Implement `NeuralConsole`, a native CLI REPL that:
1. Transforming the "Game Mode" input buffer into a full REPL.
2. Supports commands: `help`, `scan`, `status`, `morph`, `clear`.
3. Renders using the existing `TerminalEmulator` system.
4. Integrates visually with the `antigravity.pixelrts.png` texture (or overlays it).

## Visual Impact
- **Morphological Shift**: This introduces a "Terminal Overlay" that can be summoned or possessed.
- **Aesthetics**: Retro-terminal look with neon accents (green/amber) matching `TerminalColor::to_neon()`.

## Justification
- **Functionality**: Detailed system introspection requires text commands.
- **PAS Score**: Increases 'System' score by adding control depth.
