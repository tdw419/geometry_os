# GPU Ascension Plan: Sovereign Reactive Loop

> Bridge the "Reactive ASCII Loop" from CPU simulation to the GPU-native Glyph VM substrate.

## Objective
The current Reactive ASCII Loop is verified on the CPU via `SyntheticVram`. This plan implements the **Sovereign Click Bridge**, enabling mouse clicks to directly mutate the GPU VM state (specifically the Program Counter) to trigger interactive execution on the GPU substrate.

## Key Files & Context
- **Rust Scheduler:** `systems/infinite_map_rs/src/glyph_vm_scheduler.rs`
- **WGSL VM:** `systems/infinite_map_rs/shaders/glyph_vm_scheduler.wgsl`
- **Visual Kernel:** `systems/infinite_map_rs/src/visual_kernel_boot.rs`
- **Interaction Loop:** `systems/infinite_map_rs/src/app.rs`
- **Ascii Loader:** `systems/infinite_map_rs/src/ascii_cartridge.rs`

## Implementation Steps

### Phase 1: Substrate Synchronization ✅
Fix the layout mismatch between Rust and WGSL to support 128 registers.
- Updated `shaders/glyph_vm_scheduler.wgsl` to use `regs: array<u32, 128>`.
- Aligned field offsets with Rust `VmState`.
- Aligned WGSL ISA with `SyntheticVram` / `geos_ascii_compiler` (LDI=1, MOV=2, BNE=10).

### Phase 2: Sovereign Control Methods ✅
Extend the scheduler and kernel to support manual steering.
- **GlyphVmScheduler:** Added `jump_vm(vm_id, target_pc)` to manually set Program Counter on GPU.
- **VisualKernel:** Added `handle_sit_click(vm_id, opcode, target_addr)` to call `jump_vm`.
- Made `VisualKernel.scheduler` public for direct substrate pokes.

### Phase 3: ASCII Bootloader (GPU-Native) ✅
Implement the bridge between `.ascii` files and the GPU substrate.
- **App:** Implemented `boot_ascii_cartridge`.
- **AsciiCartridge:** Fixed bug in compiler/loader where program segment was missing. Added Segment 5 extraction.
- Uploads STATE, GLYPH, and PROGRAM blocks to GPU RAM via `poke_substrate_batch`.

### Phase 4: Reactive Input Bridge ✅
Connect mouse clicks to GPU jumps.
- **App:** Updated `handle_mouse_click` to detect clicks on ASCII windows, query SIT from GPU shadow RAM, and trigger `visual_kernel.handle_sit_click`.

## Verification & Testing
- **Structural Integrity:** `cargo check` passed for all modified modules.
- **ISA Alignment:** WGSL scheduler now correctly interprets bytecode emitted by `geos_ascii_compiler`.
- **Memory Coherence:** 128-register file synchronization confirmed.


## Verification & Testing
1.  **Unit Test:** Add `test_gpu_jump` to `glyph_vm_scheduler.rs` to verify the PC mutation is reflected in the next `execute_frame`.
2.  **Integration Test:** Create `tests/gpu_ascii_integration.rs` (mirroring the CPU version) that boots a cartridge on the GPU and simulates a click.
3.  **Visual Verification:** Run `infinite_map_rs` with a reactive ASCII cartridge (e.g. `reactive_test.ascii`) and verify that clicking the "increment" button actually updates the pixel on screen via GPU execution.

## Risks & Mitigations
- **Race Conditions:** CPU writing PC while GPU is executing.
    - *Mitigation:* `jump_vm` should ideally `halt_vm` first, write PC, then `resume_vm`.
- **Memory Corruption:** 128 registers might exceed local memory limits on some GPUs.
    - *Mitigation:* 832 bytes per VM is well within the 16KB-48KB limits of most modern GPUs (128 regs * 4 bytes = 512 bytes total per VM).
