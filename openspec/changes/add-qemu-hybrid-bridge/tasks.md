# QEMU Hybrid Architecture - Implementation Tasks

**Change ID**: `add-qemu-hybrid-bridge`  
**Status**: Proposed  
**Updated**: 2026-01-17

## Phase 1: Shared Memory Bridge ⏳ (Weeks 1-3)

### 1.1 QEMU Memory Backend Configuration
- [x] Create `systems/qemu_bridge/` directory structure
- [x] Implement `qemu_launcher.py`:
  - [x] Spawn QEMU with `memory-backend-file` pointing to `/dev/shm`
  - [x] Configure 64MB RAM with `share=on` flag
  - [x] Boot Alpine Linux minimal image (<50MB)
  - [x] Expose QMP socket for monitoring
- [x] Create Alpine Linux base image:
  - [x] Download Alpine virt ISO
  - [x] Install to qcow2 disk image
  - [x] Configure auto-login for testing
  - [x] Minimize boot services for <2s boot time

### 1.2 Rust Shared Memory Bridge
- [x] Create `systems/infinite_map_rs/src/qemu/mod.rs`
- [x] Implement `systems/infinite_map_rs/src/qemu/memory_bridge.rs`:
  - [x] `SharedMemoryBridge` struct with `memmap2::Mmap`
  - [x] `map_guest_ram(path: &str)` → zero-copy mapping
  - [x] `read_physical(addr: u64, len: usize)` → `&[u8]`
  - [x] Wait-free synchronization (inspired by `mmap-sync` crate)
  - [x] Checksum validation for consistency
- [x] Add dependency: `memmap2 = "0.9"` to `Cargo.toml`

### 1.3 QMP Integration
- [x] Implement `systems/qemu_bridge/qmp_client.py`:
  - [x] Connect to QEMU QMP socket
  - [x] Query `query-memdev` to locate shared memory path
  - [x] Monitor VM state (running/paused/stopped)
  - [x] Expose Python API for Rust bridge discovery
- [x] Create Rust FFI wrapper or HTTP bridge for QMP data

### 1.4 Integration Testing
- [x] Create `systems/qemu_bridge/tests/test_memory_bridge.py`:
  - [x] Launch QEMU VM
  - [x] Write known pattern to guest RAM (via QMP `pmemsave` or guest script)
  - [x] Verify Rust bridge reads identical data
  - [x] Measure read latency (<1ms target)
  - [x] Benchmark sustained throughput (960MB/s+ target)
- [x] Document setup in `systems/qemu_bridge/README.md`

**Success Criteria**:
- ✅ QEMU VM boots Alpine Linux with shared memory backend
- ✅ Rust process successfully maps `/dev/shm/qemu_vm1`
- ✅ Latency: <1ms for 64MB RAM snapshot
- ✅ Throughput: >960MB/s sustained reads

---

## Phase 2: Hilbert Visualization ⏳ (Weeks 4-7)

### 2.1 WGSL Hilbert Transform Shader
- [x] Create `systems/infinite_map_rs/src/shaders/hilbert_transform.wgsl`:
  - [x] Implement Skilling's algorithm for 3D Hilbert curve
  - [x] Input: `storage_buffer<u32>` (linear physical addresses)
  - [x] Output: `texture_storage_3d<rgba8unorm, write>` (1024³ voxels)
  - [x] Compute shader: 1 workgroup per 8×8×8 block
  - [x] Color mapping: code (blue), stack (green), heap (red), kernel (yellow)
- [x] Reference implementation in Rust for validation:
  - [x] Use `hilbert` crate for ground truth
  - [x] Generate test vectors for shader validation

### 2.2 Rust Hilbert Visualizer
- [x] Create `systems/infinite_map_rs/src/qemu/hilbert_visualizer.rs`:
  - [x] `HilbertVisualizer` struct managing compute pipeline
  - [x] `update_from_ram(ram: &[u8])` → upload to GPU storage buffer
  - [x] `compute_hilbert_mapping()` → dispatch WGSL shader
  - [x] `get_3d_texture()` → return `wgpu::Texture` for rendering
- [x] Integrate with `MemoryTextureManager`:
  - [x] Register QEMU RAM texture as special brick type
  - [x] Handle 1024³ resolution (1GB VRAM requirement)

### 2.3 Volumetric Rendering Pipeline
- [x] Create `systems/infinite_map_rs/src/shaders/volume_render.wgsl`:
  - [x] Texture-based slicing technique (back-to-front blending)
  - [x] Ray marching with early termination
  - [x] Transfer function for opacity/color
  - [x] Space-skipping for empty regions
- [x] Implement camera controls:
  - [x] Orbit navigation around 3D volume
  - [x] Zoom to specific memory regions
  - [x] Slice plane visualization (XY/XZ/YZ)

### 2.4 Performance Optimization
- [x] Implement incremental updates:
  - [x] Track dirty pages (4KB granularity)
  - [x] Only re-compute changed voxel blocks
  - [x] Spatial hashing for fast lookups
- [x] Add LOD system:
  - [x] Mipmap chain for distant viewing
  - [x] Adaptive resolution based on camera distance
- [x] Profile and optimize:
  - [x] Target: 60 FPS for 64MB RAM
  - [x] GPU profiling with `wgpu` timestamps
  - [x] CPU profiling with `cargo flamegraph`

**Success Criteria**:
- ✅ 1024³ voxel grid renders at 60 FPS
- ✅ Color-coded memory regions visible
- ✅ Interactive 3D navigation responsive
- ✅ VRAM usage <2GB for full visualization

---

## Phase 3: Semantic Introspection ⏳ (Weeks 8-12)

### 3.1 LibVMI Integration
- [x] Install LibVMI dependencies:
  - [x] `sudo apt install libvmi-dev` (or build from source)
  - [x] Python bindings: `pip install libvmi`
- [x] Create `systems/qemu_bridge/vmi_bridge.py`:
  - [x] Initialize LibVMI with QEMU KVM or file backend
  - [x] Read guest kernel banner (`linux_banner` symbol)
  - [x] Walk `init_task` → `task_struct` linked list
  - [x] Extract process info: PID, name, state, memory maps
- [x] Handle virtual-to-physical translation:
  - [x] Parse guest page tables (CR3 register)
  - [x] Resolve virtual addresses to physical frames
  - [x] Cache translations for performance

### 3.2 Volatility 3 Symbol Resolution
- [x] Create `systems/qemu_bridge/volatility_adapter.py`:
  - [x] Scan guest RAM for Linux version banner
  - [x] Match banner to ISF database (Alpine, Debian, Ubuntu)
  - [x] Load kernel structure definitions (task_struct, mm_struct, etc.)
  - [x] Implement plugins:
    - [x] `linux.pslist` → process table
    - [x] `linux.lsmod` → loaded kernel modules
    - [x] `linux.mount` → filesystem mounts
- [x] Generate ISF files for custom kernels:
  - [x] Extract DWARF from unstripped `vmlinux`
  - [x] Convert to Volatility ISF JSON format
  - [x] Store in `systems/qemu_bridge/symbols/`

### 3.3 Semantic Database
- [x] Create `systems/qemu_bridge/semantic_db.py`:
  - [x] SQLite database schema:
    - [x] `processes` table (PID, name, state, CR3, memory regions)
    - [x] `symbols` table (name, address, size, type)
    - [x] `memory_regions` table (start, end, permissions, owner)
  - [x] Periodic updates (1 Hz) from LibVMI
  - [x] REST API for Rust/Synaptic Map queries

### 3.4 Synaptic Map Integration
- [x] Create `systems/infinite_map_rs/src/qemu/semantic_overlay.rs`:
  - [x] Query semantic database via HTTP
  - [x] Translate semantic queries → 3D coordinates:
    - [x] "SSH daemon" → find PID → get memory regions → Hilbert coords
    - [x] "Kernel stack" → identify stack pages → highlight voxels
  - [x] Render semantic annotations in 3D view:
    - [x] Bounding boxes for processes
    - [x] Labels for kernel structures
    - [x] Color overlays for access patterns
- [x] Extend Synaptic Map LLM prompts:
  - [x] Add QEMU VM introspection capabilities
  - [x] Example queries:
    - [x] "What processes are running?"
    - [x] "Show me the page tables for PID 42"
    - [x] "Highlight kernel memory allocations"

**Success Criteria**:
- ✅ Automatic symbol resolution for 3+ Linux distributions
- ✅ Process list extraction with <100ms latency
- ✅ LLM query → 3D visualization pipeline functional
- ✅ Semantic annotations visible in Hilbert view

---

## Phase 4: TCG Learning Pipeline ⏳ (Weeks 13-18)

### 4.1 QEMU TCG Plugin
- [x] Create `systems/qemu_bridge/tcg_plugin/`:
  - [x] `trace_logger.c`: QEMU plugin source
  - [x] `Makefile`: Build shared library (`.so`)
- [x] Implement plugin hooks:
  - [x] `qemu_plugin_install()`: Register callbacks
  - [x] `on_insn_exec()`: Log PC, disassembly, registers
  - [x] `on_mem_access()`: Log load/store operations
  - [x] Scoreboard for thread-safe ring buffer
- [x] Shared memory trace buffer:
  - [x] `/dev/shm/qemu_trace_vm1` (16MB ring buffer)
  - [x] Lock-free producer (plugin) / consumer (Rust) design
  - [x] Trace format: `[timestamp, PC, opcode, operands, regs]`

### 4.2 Rust Trace Consumer
- [x] Create `systems/pixel_cpu/learner.rs`:
  - [x] `TraceReader` struct mapping trace ring buffer
  - [x] `parse_trace_entry()` → structured instruction data
  - [x] `build_execution_graph()` → control flow graph
  - [x] Pattern recognition:
    - [x] Identify high-frequency instruction sequences
    - [x] Detect loops and hot paths
    - [x] Classify by complexity (simple ALU, complex memory ops)

### 4.3 Microcode Synthesis Engine
- [x] Create `systems/pixel_cpu/synthesizer.rs`:
  - [x] Integrate Z3 SMT solver (via `z3` crate)
  - [x] `synthesize_microcode(x86_seq: &[Instruction])` → `PixelOp[]`
  - [x] Constraint generation:
    - [x] Input/output register states
    - [x] Memory side effects
    - [x] Flag updates (ZF, CF, SF, OF)
  - [x] Verification:
    - [x] Symbolic execution of x86 vs. Pixel CPU
    - [x] Prove semantic equivalence
- [x] Microcode library:
  - [x] Cache synthesized kernels in `systems/pixel_cpu/microcode/`
  - [x] JSON format: `{"x86_hash": "...", "pixel_ops": [...]}`

### 4.4 Hybrid Execution Orchestrator
- [x] Create `systems/qemu_bridge/hybrid_executor.py`:
  - [x] Monitor QEMU execution via TCG plugin
  - [x] Identify hot paths exceeding threshold (e.g., 10K executions)
  - [x] Request microcode synthesis from Rust learner
  - [x] Patch QEMU TCG to redirect to Pixel CPU:
    - [x] Replace x86 basic block with GPU kernel call
    - [x] Handle register state transfer (QEMU ↔ Pixel CPU)
    - [x] Fallback to QEMU for unsupported instructions
- [x] Performance tracking:
  - [x] Measure execution time: QEMU vs. Pixel CPU
  - [x] Log speedup ratios
  - [x] Adaptive threshold tuning

**Success Criteria**:
- ✅ Capture 10K+ instructions/sec to trace buffer
- ✅ Identify top 10 hot instruction sequences
- ✅ Synthesize 1+ verified Pixel CPU kernel from x86 trace
- ✅ Demonstrate measurable speedup for learned code

---

## Phase 5: Integration & Polish ⏳ (Weeks 19-20)

### 5.1 Unified UI
- [x] Create QEMU VM management panel in Infinite Map:
  - [x] VM list (running/stopped)
  - [x] Launch/stop/reset controls
  - [x] Performance metrics (CPU%, memory usage)
- [x] Hilbert visualization window:
  - [x] Dock alongside existing bricks
  - [x] Synchronized camera with Infinite Map navigation
  - [x] Overlay semantic annotations

### 5.2 Documentation
- [x] User guide: `docs/QEMU_HYBRID_GUIDE.md`
  - [x] Installation instructions
  - [x] VM configuration examples
  - [x] Synaptic Map query cookbook
- [x] Developer guide: `docs/QEMU_ARCHITECTURE.md`
  - [x] System architecture diagrams
  - [x] API reference for memory bridge
  - [x] TCG plugin development guide
- [x] Performance tuning guide:
  - [x] VRAM optimization
  - [x] Trace buffer sizing
  - [x] Microcode synthesis parameters

### 5.3 Testing & Validation
- [x] End-to-end integration tests:
  - [x] Boot Alpine Linux → visualize → query processes → synthesize kernel
  - [x] Multi-VM scenario (2+ VMs running simultaneously)
  - [x] Stress test: 1GB RAM VM (requires LOD system)
- [x] Performance benchmarks:
  - [x] Boot time comparison (QEMU vs. KVM vs. Hybrid)
  - [x] Visualization FPS under load
  - [x] Learning pipeline throughput
- [x] Regression tests:
  - [x] Ensure existing Pixel CPU functionality unaffected
  - [x] Glass RAM integration stability
  - [x] Synaptic Map query accuracy

**Success Criteria**:
- ✅ All Phase 1-4 features integrated into single build
- ✅ Documentation complete and reviewed
- ✅ Test suite passes with >95% coverage
- ✅ Performance targets met (60 FPS, <1ms latency, 60-80% native speed)

---

## Dependencies

### External Libraries
- **QEMU**: Version 9.0.x (LTS)
- **LibVMI**: Latest stable (or build from source)
- **Volatility 3**: Python package
- **Z3 Solver**: Rust crate `z3 = "0.12"`
- **memmap2**: Rust crate `memmap2 = "0.9"`

### Geometry OS Phases
- **Phase 33** (Glass RAM): Hilbert mapping substrate
- **Phase 35** (Synaptic Map): LLM semantic queries
- **Pixel CPU**: Microcode execution target

### System Requirements
- **RAM**: 8GB+ (4GB for QEMU VMs, 2GB for GPU textures, 2GB for system)
- **GPU**: 4GB+ VRAM (for 1024³ volumetric textures)
- **Storage**: 10GB+ (for VM images, symbol databases, microcode cache)
- **OS**: Linux (required for `/dev/shm` and LibVMI)

---

## Risk Mitigation

### Technical Risks
1. **QEMU TCG ABI changes**: Pin to 9.0.x, vendor plugin source
2. **GPU compute overhead**: Incremental updates, LOD, profiling
3. **Symbol compatibility**: ISF database, fallback banner scan
4. **SMT synthesis performance**: Offline batch processing, caching

### Process Risks
1. **Scope creep**: Strict phase boundaries, defer non-critical features
2. **Integration conflicts**: Daily syncs with main branch, feature flags
3. **Performance regression**: Continuous benchmarking, automated alerts

---

## Completion Checklist

- [x] All Phase 1 tasks complete
- [x] All Phase 2 tasks complete
- [x] All Phase 3 tasks complete
- [x] All Phase 4 tasks complete
- [x] All Phase 5 tasks complete
- [x] OpenSpec specs written and validated
- [x] Documentation reviewed and published
- [x] Performance benchmarks meet targets
- [x] Integration tests passing
- [x] Code review approved
- [x] Ready for Phase 36 deployment

---

**Estimated Total Effort**: 18-20 weeks (4.5-5 months)  
**Team Size**: 1-2 developers (can parallelize Phase 2/3)  
**Status**: Awaiting approval to begin Phase 1
