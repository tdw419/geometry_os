# Design: Masonry Compute Kernel

## Visual-First Architecture
The Masonry Daemon is not a system daemon in the traditional UNIX sense. It is a **Visual Process**.

```mermaid
graph TD
    A[Physical RAM] -->|DMA| B[Glass RAM Texture]
    B -->|Sampling| C[Masonry Shader (WGSL)]
    C -->|Entropy Compute| D[Segmentation Map]
    D -->|Async Readback| E[Masonry Architect (Python/Rust)]
    E -->|Decisions| F[Memory Management]
```

## Stability Mechanism: "The Glass Wall"
By placing the analysis logic behind the "Glass Wall" (the GPU texture boundary), we guarantee stability:

1.  **Read-Only Observer**: The compute shader cannot mutate system memory. It can only read the texture.
2.  **Frequency Decoupling**: The OS runs at 1000Hz+. The Masonry Scan can run at 1Hz, 10Hz, or 60Hz without blocking the OS.
3.  **Pattern Recognition**:
    *   **Texture**: 1024x1024 (1GB represented).
    *   **Kernel**: 3x3 or 5x5 Hilbert Neighbor polling.
    *   **Detection**: Sudden shifts in "Visual Texture" (pixel variance) correspond to memory region changes.

## visual_kernel.wgsl Specifications
The core logic resides in a new WGSL shader.

### Inputs
- `texture_memory`: The current frame of Glass RAM.
- `uniform_time`: For temporal variance analysis.

### Outputs
- `texture_segmentation`: A color-coded map.
    - **Red**: High execution probability (Code).
    - **Blue**: High structure probability (Stack).
    - **Green**: High randomness (Heap/Data).

## PAS (Phase Alignment Stability) Impact
- **Load**: Moves introspection load from CPU -> GPU.
- **Risk**: VRAM bandwidth saturation.
- **Mitigation**: Run compute dispatch only on "Dirty" quadrants (Quadtree update).
