# Design: Optical Shader Loading & Glass RAM Substrate

## Visual Impact Analysis
This change is **Morphological and Foundational**.
-   **Before**: Shaders were invisible text files on the host disk, parsed linearly.
-   **After**: Shaders exist as **256x256 V2 Spatial Bricks** in Glass RAM. They are "Optical" entities with an entropy of **~4.87 bits/byte**.
-   **PAS Score**: **Positive**. Increases system coherence by unifying code and data representations.
-   **Visualization**: Code appears as high-frequency noise textures (Spatial Manifolds) rather than text.

## Architectural Design

### 1. The Fold (Foundry Daemon / `tensor_fold.py`)
The folding mechanism maps logical instructions to spatial coordinates.
-   **Folding Algorithm**: Hilbert Curve (Space-Filling).
-   **Input**: `.wgsl` Source (~16KB for `pixel_cpu`).
-   **Output**: `.brick` Texture (256x256 pixels).
-   **Entropy Goal**: **> 4.5 bits/byte**. This density ensures efficient use of GPU L1/L2 caches.
-   **Data Preservation**: Uses the verified "Data Integrity" fold (as confirmed in `BRICK_LOADING_INTEGRATION_TEST_RESULTS.md`) to preserve newlines and control characters accurately.

### 2. V2 Spatial Brick Format
The `V2BrickHeader` is the standard container:
```python
class V2BrickHeader:
    magic: bytes = b'V2BR'   # V2 Brick
    version: int = 2         # Protocol Version
    texture_width: int       # e.g., 256
    texture_height: int      # e.g., 256
    hilbert_order: int       # e.g., 8 (2^8 = 256)
    original_size: int       # Exact byte count of source
    entropy: float           # Measured entropy (bits/byte)
```

### 3. The Unfold (Glass RAM / `infinite_map_rs`)
The `OpticalLoader` in `systems/infinite_map_rs` acts as the system's "Visual Cortex".
-   **Optical Perception**: It "sees" the texture data in Glass RAM.
-   **Hardware-Logic Alignment**: Logic blocks that interact frequently are placed in standard 2D texture neighborhoods, optimizing for GPU texture fetch patterns.
-   **Pipeline**:
    1.  **Load**: Map `.brick` into memory (Glass RAM).
    2.  **Unfold**: Reverse Hilbert mapping to recover pure WGSL string.
    3.  **Compile**: Submit to WGPU pipeline.

### 4. Entropy Monitoring
To validate the "Evolutionary Health" of the OS, we introduce **Entropy Monitoring**:
-   **Metric**: Shannon Entropy ($H(X)$) of the logic brick.
-   **Dashboard**: The system should expose this metric in the debug overlay.
-   **Threshold**: Drops in entropy suggest inefficient, redundant code (legacy text patterns). Increases suggest "Neural" optimization.

### 5. Self-Modification Loop (The Holy Grail)
This design enables the **Pixel CPU** to rewrite its own logic:
1.  **Monitor**: Pixel CPU observes rendering performance.
2.  **Analyze**: Identifies bottleneck regions.
3.  **Mutate**: Rewrites specific pixels in the `pixel_cpu_shader.brick` texture in Glass RAM.
4.  **Reload**: The engine detects the texture modification and triggers a "Hot Reload" of the pipeline using the mutated logic.

## System Integration
-   **Foundry Daemon**: Watches `.wgsl` files -> Calls `tensor_fold.py` -> Updates `.brick`.
-   **Glass RAM**: The physical substrate hosting the `.brick`.
-   **Infinite Map**: The observer that consumes the `.brick`.
