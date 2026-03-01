# Domain Pitfalls: GPU Linux Execution

**Domain:** WebGPU-based RISC-V emulation for Linux kernel boot
**Researched:** 2026-02-28
**Confidence:** MEDIUM (based on codebase analysis + web research)

---

## Critical Pitfalls

Mistakes that cause rewrites or major system failures.

### Pitfall 1: Dispatch Boundary State Loss

**What goes wrong:** CPU state (registers, PC, CSRs) appears corrupted or reset between GPU dispatch calls because WebGPU is a stateless API. The shader modifies state in the storage buffer, but the JavaScript side reads stale cached values or the buffer mapping completes before GPU writes are visible.

**Why it happens:** WebGPU dispatches are asynchronous. Reading state immediately after `dispatchWorkgroups()` returns cached CPU-side data, not GPU results. The `mapAsync()` call must complete before reading.

**Consequences:**
- PC jumps to wrong addresses
- Register values appear as zeros
- Syscall arguments lost between GPU and JS bridge
- Timer interrupts fire with wrong PC

**Prevention:**
```javascript
// WRONG: Read immediately after dispatch
passEncoder.dispatchWorkgroups(1);
passEncoder.end();
device.queue.submit([commandEncoder.finish()]);
const state = await readState(); // May read before GPU finishes

// CORRECT: Ensure GPU-CPU sync
passEncoder.dispatchWorkgroups(1);
passEncoder.end();
device.queue.submit([commandEncoder.finish()]);
await stagingBuffer.mapAsync(GPUMapMode.READ); // Waits for GPU
const state = new Uint32Array(stagingBuffer.getMappedRange());
```

**Detection:**
- PC values that don't increment by 1 after non-branch instructions
- Registers that were written appearing as 0 on next read
- Syscall handler receiving all-zero arguments

**Phase to address:** Phase 1 (Core Execution Loop) - Must establish reliable state readback before any syscall handling.

---

### Pitfall 2: Weak Memory Consistency in Multi-Instruction Loops

**What goes wrong:** The shader executes 100+ instructions per dispatch (see `for (var step = 0u; step < 100u; step++)`), but instructions that depend on previous memory writes see stale values because GPU threads have weak memory ordering.

**Why it happens:** GPU compute shaders use weak memory consistency. A store followed immediately by a load from the same address may not see the stored value without explicit barriers. The current shader has no `storageBarrier()` or `workgroupBarrier()` calls inside the instruction loop.

**Consequences:**
- Self-modifying code breaks (instruction fetch sees old bytes)
- Store-then-load sequences return wrong values
- Stack operations (PUSH/POP) corrupt data
- MMU page table updates not visible to subsequent accesses

**Prevention:**
```wgsl
// For single-threaded execution within a workgroup:
// Memory writes to storage buffers are NOT automatically visible
// Need to either:
// 1. Use atomic operations for shared state
// 2. Split into multiple dispatches with CPU-side sync
// 3. Use storageBarrier() if multiple threads share memory

// Current code relies on single-thread execution (workgroup_size(64)
// but only core_id 0 does real work). This is safe ONLY because
// there's no cross-thread communication.
```

**Detection:**
- Memory writes followed by reads returning old values
- Page fault on address that was just written to page tables
- LR/SC reservation failures when no other core is active

**Phase to address:** Phase 2 (Memory Subsystem) - When implementing coherent memory for multi-core or DMA.

---

### Pitfall 3: UART/SBI Bridge Race Condition

**What goes wrong:** The GPU sets `SBI_BRIDGE_FLAG` to signal JS to handle a syscall, then waits. But if JS doesn't read/clear the flag before the next dispatch, the GPU sees the flag still set and immediately breaks out of its instruction loop, making no progress.

**Why it happens:** The shader checks `sbi_flag != 0` at the START of each step loop and breaks. If the flag isn't cleared by JS between dispatches, the shader executes 0 instructions that frame.

**Consequences:**
- Syscalls "hang" (GPU makes no progress after first syscall)
- Console output stalls
- Timer interrupts never fire (shader never reaches check)
- Apparent deadlock with no error message

**Prevention:**
```javascript
// In _checkSBICalls():
// MUST clear flag BEFORE resuming GPU execution
const clearFlag = new Uint32Array([0]);
this.device.queue.writeBuffer(kernel.memoryBuffer, SBI_BRIDGE_FLAG, clearFlag);
// THEN update return values in registers
this.device.queue.writeBuffer(kernel.stateBuffer, 10 * 4, retRegs);
```

**Detection:**
- `cycleCount` increments but `pc` never changes
- `SBI_BRIDGE_FLAG` remains set across multiple `tick()` calls
- No UART output despite kernel writing to UART

**Phase to address:** Phase 1 (Core Execution) - SBI bridge is essential for any kernel output.

---

### Pitfall 4: Page Table Walk Infinite Loop / Memory Exhaustion

**What goes wrong:** The MMU page table walker (`translate_address`) can read invalid PTEs that point back to themselves, creating circular walks. The shader has no iteration limit on page table depth.

**Why it happens:** Sv32 has 2 levels but if a PTE is corrupted (V=0 but address non-zero, or PPN points to random memory), the walker may read garbage that looks like another PTE pointer. The code checks `pte1_addr >= 134217728u` (128MB) but doesn't detect circular references.

**Consequences:**
- Shader hangs (exceeds GPU timeout, browser kills it)
- Out-of-bounds memory access (WebGPU may undefined-behavior)
- Random page fault codes
- Browser tab crash

**Prevention:**
```wgsl
// Add depth limit to page table walk
fn translate_address(vaddr: u32, access_type: u32, base_idx: u32) -> u32 {
    let satp = cpu_states[base_idx + CSR_SATP];
    let satp_mode = (satp >> 31u) & 1u;

    if (satp_mode == 0u) { return vaddr; }

    // Track walk depth to prevent infinite loops
    var walk_depth: u32 = 0u;
    const MAX_WALK_DEPTH: u32 = 4u; // Sv32 needs max 2, extra for safety

    // ... in walk loop ...
    walk_depth = walk_depth + 1u;
    if (walk_depth > MAX_WALK_DEPTH) {
        return 0xFFFFFFFFu; // Fault
    }
}
```

**Detection:**
- Shader execution time exceeds 2-3 seconds
- `scause` = 12/13/15 (page fault) with nonsensical `stval`
- Memory reads from addresses far outside 0-128MB range

**Phase to address:** Phase 3 (MMU Implementation) - Before enabling virtual memory.

---

### Pitfall 5: PC Indexing Confusion (Instruction vs Byte Address)

**What goes wrong:** The shader uses `pc` as an instruction index (increments by 1) but the MMU translates `pc * 4u` to get byte address. Linux kernels expect byte-addressed PCs. Mixing conventions causes jumps to wrong addresses.

**Why it happens:** RISC-V PCs are byte addresses (4-byte aligned for 32-bit instructions). The shader stores `pc` as instruction index for convenience but the translation layer multiplies by 4. If anywhere in the code forgets this, addresses are off by 4x.

**Consequences:**
- JAL/JALR jump to wrong targets
- Branch offsets calculated incorrectly
- Instruction fetch faults on valid addresses
- `sepc` saved incorrectly on traps

**Prevention:**
```wgsl
// Establish clear convention:
// - cpu_states[32] (PC) is INSTRUCTION INDEX (word address)
// - When translating: vaddr = pc * 4u (byte address)
// - When saving to SEPC: save byte address OR word address consistently
// - Document which functions expect which

// Example bug:
// pc = trap_enter(...) // Returns byte address
// cpu_states[base_idx + 32u] = pc / 4u; // But PC is stored as word index
```

**Detection:**
- JAL offset calculation produces wrong target
- `sepc` on trap doesn't match expected return address
- PC appears to jump to middle of instruction

**Phase to address:** Phase 1 (Core Execution) - Must standardize before implementing jumps.

---

## Moderate Pitfalls

Mistakes that cause delays or technical debt.

### Pitfall 6: Workgroup Size Mismatch with Shader Loop

**What goes wrong:** The shader declares `@workgroup_size(64)` but only uses `core_id == 0`. The other 63 threads do nothing but still consume GPU resources. If dispatching multiple kernels, this wastes 98% of GPU capacity.

**Why it happens:** The code was designed for multi-core execution but currently only uses single-core. The workgroup size was kept at 64 for future expansion.

**Consequences:**
- Poor GPU utilization (1/64 threads active)
- Lower-than-expected MIPS
- May hit workgroup limits when adding features

**Prevention:**
Either use all 64 threads (true multi-core) or reduce to `@workgroup_size(1)` for single-core.

**Phase to address:** Phase 4 (Multi-Core) - Or immediately change to `@workgroup_size(1)`.

---

### Pitfall 7: CSR Index Magic Numbers

**What goes wrong:** CSR indices like `34u` (SATP), `35u` (STVEC) are scattered throughout the shader. If a new CSR is inserted, all indices shift, breaking the code.

**Why it happens:** Initial implementation used sparse indices, then added more CSRs in between.

**Consequences:**
- Adding CSRs requires finding all magic numbers
- Easy to miss one, causing subtle bugs
- JavaScript/Shader CSR indices can diverge

**Prevention:**
Use constants defined at shader top (already done for most, but some remain inline).

**Phase to address:** Phase 1 (Core Execution) - Audit and consolidate.

---

### Pitfall 8: Timer Interrupt Firing in Wrong Mode

**What goes wrong:** Timer interrupt fires while already in supervisor mode handling a previous trap, causing nested trap corruption.

**Why it happens:** The shader checks timer interrupt before every instruction, but doesn't properly check `SSTATUS.SIE` (interrupt enable) vs current mode.

**Consequences:**
- SEPC overwritten by nested trap
- Kernel stack corruption
- Infinite trap loop

**Prevention:**
```wgsl
fn check_timer_interrupt(base_idx: u32) -> bool {
    let sstatus = cpu_states[base_idx + CSR_SSTATUS];
    let mode = cpu_states[base_idx + CSR_MODE];

    // Don't fire if already in supervisor mode (prevents nesting)
    if (mode == 1u) { return false; } // ADD THIS CHECK

    // Check if interrupts enabled
    if ((sstatus & SSTATUS_SIE) == 0u) { return false; }
    // ...
}
```

**Phase to address:** Phase 2 (Interrupt Handling) - When enabling preemptive multitasking.

---

### Pitfall 9: Storage Buffer Size Assumptions

**What goes wrong:** Code assumes 128MB memory buffer exists, but `maxStorageBufferBindingSize` varies by device (some GPUs only support 1GB, some 2GB, some much less).

**Why it happens:** WebGPU limits are device-dependent. Chrome on integrated graphics may have lower limits than discrete GPU.

**Consequences:**
- Shader fails to create on some devices
- Out-of-bounds access crashes
- "Device lost" errors

**Prevention:**
```javascript
const adapter = await navigator.gpu.requestAdapter();
const requiredSize = 128 * 1024 * 1024; // 128MB

if (adapter.limits.maxStorageBufferBindingSize < requiredSize) {
    // Fallback to smaller memory or fail gracefully
    console.error('GPU does not support required memory size');
    return null;
}

// Request device with required limits
const device = await adapter.requestDevice({
    requiredLimits: {
        maxStorageBufferBindingSize: requiredSize
    }
});
```

**Phase to address:** Phase 0 (Initialization) - Before any GPU work.

---

### Pitfall 10: Missing Halt Condition Check

**What goes wrong:** Kernel sets halt flag but shader continues executing because the check is inside the step loop and may not be reached if stuck in a branch.

**Why it happens:** `halted` check is at loop start, but if PC jumps to invalid address, the shader may fault before reaching halt check.

**Consequences:**
- "Zombie" execution after kernel exit
- Wasted GPU cycles
- Memory corruption

**Prevention:**
Add halt check after any operation that could set halt flag (e.g., after SBI shutdown call).

**Phase to address:** Phase 1 (Core Execution).

---

## Minor Pitfalls

Mistakes that cause annoyance but are fixable.

### Pitfall 11: Console Output Buffer Overflow

**What goes wrong:** UART FIFO is 256 bytes. If kernel outputs faster than JS reads, characters are lost.

**Why it happens:** No backpressure mechanism. GPU writes, JS polls.

**Prevention:**
Implement flow control in SBI handler (return error if buffer full).

**Phase to address:** Phase 2 (I/O Subsystem).

---

### Pitfall 12: Float-to-Int Conversion in Morphological Decoder

**What goes wrong:** Texture samples return floats 0.0-1.0. Converting to bytes via `u32(val * 255.0)` can have rounding errors at edges.

**Why it happens:** Float precision near 1.0 may round to 256, causing overflow.

**Prevention:**
```wgsl
let byte = min(u32(val * 255.0 + 0.5), 255u); // Clamp and round
```

**Phase to address:** Phase 3 (Kernel Loading).

---

### Pitfall 13: DTB Alignment

**What goes wrong:** Device Tree Blob placed at unaligned address, causing misaligned load faults.

**Why it happens:** DTB generated in JS may not be 8-byte aligned.

**Prevention:**
Ensure DTB address is page-aligned (4KB or at least 8-byte).

**Phase to address:** Phase 2 (Boot Protocol).

---

## Integration Pitfalls with Existing System

### Pitfall I1: Infinite Map Coordinate System vs Linear Memory

**What goes wrong:** The existing InfiniteMap uses 2D tile coordinates with Hilbert curves. The GPU emulator uses linear 1D addresses. Mapping between them is non-trivial.

**Why it happens:** Two different spatial metaphors (visual tiles vs flat memory).

**Consequences:**
- Framebuffer display at wrong location
- Memory corruption when visual updates overlap emulator memory
- Confusion about which coordinate system to use

**Prevention:**
Define clear mapping: `memory_addr -> tile(x,y) + offset`. Use the `phys_to_morton()` function in shader for spatial locality.

**Phase to address:** Phase 5 (Display Integration).

---

### Pitfall I2: GlyphExecutor State Conflicts

**What goes wrong:** GlyphExecutor already manages some GPU resources. GPUExecutionSystem creates its own buffers. Resource limits may be exceeded.

**Why it happens:** Two systems independently allocating GPU memory.

**Consequences:**
- Out-of-memory errors
- Resource binding conflicts
- Texture sampling returns wrong data

**Prevention:**
Use shared GPUMemoryManager (already partially implemented in `gpu_memory_manager.js`).

**Phase to address:** Phase 0 (Architecture) - Before parallel development.

---

### Pitfall I3: Neural Event Bus (NEB) Integration Race

**What goes wrong:** NEB expects synchronous event handling. GPU execution is async. Events may be processed out of order.

**Why it happens:** NEB designed for CPU-side agents, not GPU-bound kernels.

**Consequences:**
- Event handlers receive stale state
- Semantic routing fails
- Agent coordination breaks

**Prevention:**
Add async-aware NEB adapters or serialize GPU state updates before publishing events.

**Phase to address:** Phase 6 (NEB Integration).

---

## Phase-Specific Warnings

| Phase Topic | Likely Pitfall | Mitigation |
|-------------|---------------|------------|
| Core Execution Loop | Dispatch boundary state loss (#1) | Implement proper async readback |
| Memory Subsystem | Weak consistency (#2) | Add storage barriers or single-dispatch batches |
| MMU Implementation | Page table walk infinite loop (#4) | Add depth limit to walker |
| Interrupt Handling | Timer firing in wrong mode (#8) | Check current mode before firing |
| Display Integration | Coordinate system mismatch (I1) | Define explicit mapping functions |
| Multi-Core | Workgroup size mismatch (#6) | Use all threads or reduce size |

---

## Quick Reference: Early Warning Signs

| Symptom | Check First |
|---------|-------------|
| PC not incrementing | Dispatch boundary state loss (#1) |
| Registers always zero | Dispatch boundary state loss (#1) or storage buffer not mapped |
| Syscall never completes | SBI bridge race (#3) |
| Shader timeout/hang | Page table walk (#4) |
| Jump to wrong address | PC indexing confusion (#5) |
| No UART output | SBI bridge race (#3) or UART overflow (#11) |
| "Device lost" error | Storage buffer size (#9) |
| Random crashes after boot | Weak consistency (#2) |

---

## Sources

- [W3C WebGPU Specification](https://www.w3.org/TR/webgpu/) - Stateless API design, buffer mapping
- [Unity WebGPU Limitations](https://docs.unity3d.com/6000.2/Documentation/Manual/WebGPU-limitations.html) - Barrier restrictions, compute limitations
- [GPU Memory Consistency - SIGARCH](https://www.sigarch.org/gpu-memory-consistency-specifications-testing-and-opportunities-for-performance-tooling/) - Weak memory model testing
- [Chrome Developers - WebGL to WebGPU](https://developer.chrome.google.cn/blog/from-webgl-to-webgpu) - Async model, command batching
- [RISC-V Linux Boot Analysis](https://blog.csdn.net/laumy_07/article/details/150430774) - MMU enablement challenges
- Codebase analysis: `/systems/visual_shell/web/shaders/visual_cpu_riscv.wgsl`
- Codebase analysis: `/systems/visual_shell/web/gpu_execution_system.js`
- Codebase analysis: `/systems/visual_shell/web/wgpu_linux_hypervisor.js`
