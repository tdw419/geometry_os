# Plan: Bare-Metal RV64 GPU Execution Path

## Objective
Design and implement a bare-metal execution path for RISC-V RV64 on AMD GPUs using the Linux DRM subsystem. This bypasses WebGPU (WGSL) limitations, specifically the lack of native `u64` support and buffer size constraints, enabling high-performance spatial execution of 64-bit OS kernels (like Ubuntu RV64).

## Background & Motivation
- **The Problem:** WebGPU's WGSL lacks native `u64`, forcing expensive `vec2<u32>` emulation for 64-bit registers and addresses. WebGPU also imposes strict buffer limits (typically 128MB-2GB depending on implementation), which is insufficient for full 64-bit OS environments.
- **The Solution:** Leverage the existing DMA-BUF and AMDGPU DRM infrastructure in `systems/infinite_map_rs` to submit SPIR-V compute shaders directly to the GPU. SPIR-V supports native `u64` and direct VRAM access.
- **The Vision:** "The Screen is the Hard Drive." By running the VM natively on the GPU and sharing the framebuffer via DMA-BUF, we achieve zero-copy visualization in the PixiJS Visual Shell while maintaining native compute performance.

## Key Files & Context
- `systems/infinite_map_rs/src/backend/drm/`: Core DRM/AMDGPU infrastructure.
- `systems/infinite_map_rs/src/riscv_native/`: Native RISC-V VM pipeline.
- `systems/infinite_map_rs/src/shaders/riscv_linux_vm.wgsl`: Existing RV32 implementation (to be ported/extended to SPIR-V/RV64).
- `systems/infinite_map_rs/src/backend/drm/amdgpu/command_buffer.rs`: PM4 packet builder for AMDGPU.

## Proposed Architecture: GPU-First RV64 VM

### 1. Direct Compute Layer (The "Metal" Path)
- Port the `riscv_linux_vm.wgsl` logic to GLSL/SPIR-V.
- Enable `Int64` and `Int64Atomics` SPIR-V capabilities.
- Use `PhysicalStorageBuffer` for direct VRAM pointers, bypassing descriptor set limits.

### 2. AMDGPU Submission Engine
- Complete the `AmdgpuCommandBuffer` implementation in `systems/infinite_map_rs/src/backend/drm/amdgpu/`.
- Implement `DRM_IOCTL_AMDGPU_CS` for direct command stream submission.
- Manage GPU virtual memory (GVM) and buffer objects (BO) via `libdrm_amdgpu`.

### 3. Spatial Framebuffer Sharing
- Use `DMA-BUF` to export the VM's framebuffer from the native GPU context.
- Import the `DMA-BUF` as a `GpuExternalTexture` in PixiJS v8.
- Maintain 60 FPS synchronization between the native VM and the visual shell.

## Implementation Plan

### Phase 1: SPIR-V RV64 Kernel (The Emulator)
- [ ] Create `systems/infinite_map_rs/src/shaders/riscv64_vm.glsl`.
- [ ] Implement RV64I base instruction set using native `uint64_t`.
- [ ] Implement Sv39 or Sv48 MMU for 64-bit virtual memory.
- [ ] Implement native 64-bit CSRs.

### Phase 2: Native Submission (The Driver)
- [ ] Extend `AmdGpuDevice` to handle memory allocation (`amdgpu_bo_alloc`).
- [ ] Implement `AmdgpuCommandBuffer::submit` using `ioctl`.
- [ ] Create a `NativeRiscvExecutor` that coordinates shader loading, memory mapping, and submission.

### Phase 3: Visual Integration (The Link)
- [ ] Enhance `DmaBuf` module to support 64-bit framebuffer offsets.
- [ ] Create a bridge between `infinite_map_rs` and the PixiJS shell for zero-copy texture updates.
- [ ] Implement a "Spatial Debugger" overlay that visualizes the RV64 registers directly from GPU memory.

## Verification & Testing
- **Compliance:** Run `rv64ui-p-*` compliance tests on the native GPU executor.
- **Performance:** Benchmark context switch time and instructions-per-second (IPS) against the WGSL implementation.
- **Visuals:** Verify zero-copy framebuffer sharing with PixiJS at 60 FPS.
- **Stability:** Long-running stress test booting a minimal RV64 Linux kernel.

## Migration & Rollback
- The existing WGSL RV32 VM remains as a fallback for non-AMD GPUs or Web-only environments.
- The system will auto-detect AMDGPU availability and "elevate" to the native RV64 path when possible.
