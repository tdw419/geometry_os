# Phase 21 Design: The HSML Kernel

## Goal
Transition from "File Manager" to "Spatial Operating System".

## Architecture
1. **Kernel**: `HyperContext` (UDG) manages state.
2. **Renderer**: `HSMLRenderer` maps UDG entities to `isRenderGroup` containers in PixiJS v8.
3. **Input**: Pointer events decode to `{x,y,z}` queries on the UDG.

## Implementation Status
- [x] `@geometry-os/hsml` package created.
- [x] `HSMLRenderer` (v8 Native) implemented.
- [x] `next_gen/src/index.js` bootstrapped with HSML Kernel.

## Next Steps
- Implement "Spatial Timeouts" in the Distributed Build System.
- Visualizing `links` (verbs) between entities.
