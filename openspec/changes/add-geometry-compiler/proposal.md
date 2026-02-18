# Proposal: Add Geometry Compiler (geo-c)

## Title
Add Geometry Compiler (geo-c): Self-Referential Compilation to Tensor Fields

## Change ID
`add-geometry-compiler`

## Author
Geometry OS Team

## Status
Proposed

## Summary
Implement a compiler (`geo-c`) that parses high-level source code (Rust/Python) and compiles it directly into `.rts` tensor fields (PNG images), enabling Geometry OS to "self-host" by generating its own executable substrate.

## Rationale
With the successful implementation of the **Optical Hypervisor** (Phase 34), Geometry OS now possesses a "Liquid State Architecture" runtime capable of executing logic embedded in textures. To fully realize the vision of "The Image is the Computer," we must eliminate the dependency on external build tools (like `cargo` producing binaries) for the OS logic itself. The OS must be able to compile its own source into the format it executes (tensors).

## Architecture

### 1. Source Parser
- Parses input source code into an Abstract Syntax Tree (AST).
- Initially supports a subset of Rust or a custom "Geometry Assembly".

### 2. Tensor Mapper (The "Retina")
- Maps AST nodes to Tensor Pixel Protocol (TPP) values:
  - **Red Channel**: Instruction/Opcode Class.
  - **Green Channel**: Data/Activation Value.
  - **Blue Channel**: Synaptic Weights/Pointers.
  - **Alpha Channel**: State Metadata.

### 3. Hilbert Layout Engine
- Projects linear code blocks into 2D Hilbert Space.
- Optimizes spatial locality to minimize "synaptic distance" (pointer length) between related functions.

### 4. Linker
- Resolves symbolic references to relative 2D coordinates.
- Generates the final `.rts` PNG image.

## Impact

### Visual
- The "binary" of the OS will be viewable as a beautiful, structured image using standard image viewers.
- Compilation can be visualized as "growing" the texture.

### Functional
- Enables true self-modification and evolution of the OS at the substrate level.
- Moving towards Phase 36: Real-time Evolution.

## Risks
- **Complexity**: Mapping control flow to 2D topology is non-trivial.
- **Debugging**: "Stack traces" will now be "Texture Coordinate Trails".

## Success Criteria
- [ ] `geo-c` can compile a simple "Hello World" (or "Light Pixel") program.
- [ ] The generated `.rts` file executes correctly in `glass_boot`.
