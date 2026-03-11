# System Tasks: QEMU Memory Bridge

## Phase 1: Core Infrastructure
- [x] **Implementation**: Create `SharedMemoryBridge` struct in `systems/infinite_map_rs`.
- [x] **Dependency**: Add `memmap2` and `libc` to `Cargo.toml`.
- [x] **Logic**: Implement `new(vm_id)` to map `/dev/shm/qemu_ram_{id}`.
- [x] **Logic**: Implement `read_physical(offset, length)` with bounds checking.
- [x] **Safety**: Ensure `mmap` is `PROT_READ` only.

## Phase 2: QMP Orchestration
- [x] **Script**: Create `systems/qemu_bridge/qemu_launcher.py`.
- [x] **QMP**: Implement handshake and `query-memdev` validation.
- [x] **Discovery**: Auto-detect running VMs via socket scanning (implemented via `/dev/shm` scanning).

## Phase 3: Integration & Visualization
- [x] **Integration**: Wire `SharedMemoryBridge` into `InfiniteMapApp`.
- [x] **Visual**: Map RAM buffer to a WGPU texture (R32Uint/RGBA8).
- [x] **Hilbert Curve**: Implement locality-preserving 2D mapping using pre-computed LUT.
- [x] **Optimization**: Implement dirty page tracking (optional for v1).

## Phase 4: Validation
- [x] **Test**: `test_performance_latency`: Benchmark snapshot speed.
- [x] **Test**: `test_snapshot_consistency`: Verify checksums during concurrent writes.
