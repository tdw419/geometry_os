# Track: Vast Substrate (Tiled PixelFS)

**Status:** Initializing  
**Goal:** Scale PixelFS to 1GB+ using a tiled PNG backing store with Hilbert curve addressing.

## 1. Objectives
- [ ] Implement `TileStore` class to manage a directory of PNG tiles.
- [ ] Implement Hilbert curve mapping for global-to-local pixel addressing.
- [ ] Upgrade `Superblock` to handle multi-tile capacity.
- [ ] Support larger file sizes (increase `MAX_BLOCKS_PER_INODE`).
- [ ] Create a `vast-mount` tool.

## 2. Technical Strategy
### Tiled Addressing
A linear address $A$ is mapped to:
1.  **Tile Index:** $T = A / (\text{pixels per tile})$
2.  **Local Address:** $L = A \pmod{\text{pixels per tile}}$

The local address $L$ is converted to $(x, y)$ within the tile using a Hilbert curve to preserve spatial locality of data blocks.

### Storage Layout
- `root/`: Directory containing tiles.
- `root/tile_0_0.png`, `root/tile_0_1.png`, ...
- `root/substrate.meta.json`: Superblock and tile configuration.

## 3. Implementation Phases
### Phase 1: The Multi-Store (Core) [COMPLETED]
- [x] Refactor `pixelfs` into a library-friendly structure.
- [x] Build `TileStore`.
- [x] Update `Superblock` to support $2^{32}$ pixels.
- [x] Verified 1GB substrate with multi-tile writing.

### Phase 2: Spatial Locality [COMPLETED]
- [x] Integrate `hilbert-curve` logic.
- [x] Implement luminosity-based "Heatmap" pulse on read/write.
- [x] Verify that adjacent blocks in a file are adjacent in the PNG landscape.

### Phase 3: Visual Shell Integration [COMPLETED]
- [x] Create a shader that can sample from the tiled texture atlas for real-time visualization in Geometry OS (`src/kernel/substrate.wgsl`).
- [x] Integrate substrate shader into `VisualCortex` rendering pipeline (`src/kernel/render.rs`).
- [x] Create a verification tool to exercise the GPU substrate rendering (`src/bin/vision_render.rs`).

### Phase 4: Core FS Operations & Spatial Health [COMPLETED]
- [x] Implement `VastExtent` for efficient multi-block storage (Week 3).
- [x] Build `VastAllocator` with refcount-based garbage collection and spatial compaction (Week 3).
- [x] Verified bit-perfect roundtrip for extent-based reads/writes in `vast_pixelfs_week3_tests.rs` (Week 3).

### Phase 5: System Integration & Directories [WEEK 4]
- [ ] **Vast VFS Bridge:** Integrate `VastPixelFS` into `src/vfs.rs` to allow VM processes to use tiled storage.
- [x] **Hierarchical Directories:** Support nested spatial directories using Inodes as directory containers (Completed).
- [ ] **Vast Management Tool:** Create a Rust CLI (`src/bin/vast_tool.rs`) for initializing, mounting, and inspecting the substrate.
- [ ] **Structural Health Monitoring:** Integrate the "TEC-Rigidity" detection logic into the allocator to maintain substrate stability.

## 4. Success Criteria
- [x] Store a 100MB file using multi-block extents (Verified in Week 3 tests).
- [ ] Mount the Vast Substrate as the primary Geometry OS `/` filesystem.
- [x] Navigate a nested directory structure visualized in the Infinite Map (Verified in Week 4 tests).
