# Proposal: Macromedia Studio MX to PixelRTS Integration

## Problem
Currently, the Geometry OS lacks a legacy visual authoring environment that aligns with its "Visual Computation" philosophy. Modern tools (VS Code, etc.) are symbolic. The user wishes to resurrect the Macromedia Studio MX suite (Flash, Fireworks, Freehand) as a native PixelRTS v2 container and evolve it into a PixiJS-native IDE.

## Proposed Solution
1. **Inception Wrap**: Use the Inception Protocol (Phase 17) to wrap the `Macromedia Studio MX (including Cold Fusion, Dreamweaver, Fireworks, Flash & Freehand).zip` into a bootable visual container (`macromedia.rts.png`).
2. **Runtime Environment**: Boot a minimal Linux kernel + Wine environment (via QEMU) hosted inside the RTS, with the suite pre-installed or ready to launch.
3. **PixiJS Bridge (The Morph)**: Implement a JSFL (Flash JavaScript API) script that maps Flash timelines and symbols to PixiJS `Container` and `Sprite` structures, effectively turning Flash MX into a visual editor for PixiJS.

## Impact
- **Visual Integrity**: Maintains the "Software as Texture" principle of Geometry OS.
- **Productivity**: Leverages decades of refined animation workflow (Flash) for modern GPU-native rendering (PixiJS).
- **Geometric Alignment**: Maps legacy hierarchical symbols to the Neural-Digital Substrate.

## Phase Alignment Stability (PAS) Impact
- **Initial**: -0.05 (due to legacy binary overhead).
- **Post-Bridge**: +0.15 (enables rapid visual iteration of shell components).
