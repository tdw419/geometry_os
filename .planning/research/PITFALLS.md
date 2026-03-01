# Pitfalls Research: GPU-Based Linux Execution

**Domain:** GPU-based kernel/OS execution via WebGPU compute shaders
**Researched:** 2026-02-28
**Confidence:** MEDIUM (based on existing codebase, WebGPU docs, GPU memory model research)

## Summary

GPU-based Linux kernel execution faces three critical risk categories: (1) WebGPU sandbox restrictions that prevent true hardware access, (2) GPU memory model mismatches with CPU assumptions, and (3) performance paradoxes where GPU emulation is slower than CPU. The existing RISC-V emulator in WGSL already demonstrates workarounds for some issues (atomic locks, syscall delegation), but full Linux boot introduces new challenges around virtual memory, interrupts, and timing that require careful architectural decisions.

---

## Critical Pitfalls

### 1. WebGPU Sandbox Memory Restrictions (CRITICAL)

**What goes wrong:** WebGPU compute shaders run in browser sandbox and cannot access real hardware. Kernel emulation requiring MMU management, device I/O, or direct memory access hits hard walls.

**Why it happens:** Browsers deliberately prevent GPU shaders from:
- Direct hardware access (no /dev/mem equivalent)
- Fine-grained memory management (no mmap)
- System calls to host OS
- Interrupt handling

**Warning signs:**
- Attempts to read/write MMIO regions return garbage or hang
- Page table updates don't affect actual memory translation
- Device registers (UART, timers) require constant host-side polling

**Prevention:**
- Design for **paravirtualization** from the start (guest knows it's virtualized)
- Use MMIO regions that trigger host-side callbacks (existing syscall_queue pattern)
- Never try to implement real page table walking in shader - fake it with linear addressing
- All privileged operations must round-trip to host CPU

**Phase to address:** Architecture phase - must be designed in, not retrofitted

**Impact if missed:** Complete rewrite when real hardware interaction is attempted

**Existing mitigation in codebase:**
```wgsl
// riscv_executor.wgsl lines 660-684
fn handle_syscall(pc: u32) -> u32 {
    // Delegates to host via syscall_queue - correct pattern
    syscall_queue[entry_idx].num = read_reg(17u);
    vm_status[vm_id] = 1u; // STATUS_WAITING_SYSCALL
    return pc + 4u;
}
```

---

### 2. GPU-CPU Memory Coherence Failure (CRITICAL)

**What goes wrong:** Linux kernel assumes sequential consistency for memory operations. GPU shaders use weak memory models where writes may not be visible in order.

**Why it happens:**
- CPUs use cache coherence protocols (MESI) for strong consistency
- GPUs use relaxed consistency models for parallelism
- `std::atomic` semantics don't translate across CPU-GPU boundary
- Cross-device barriers don't exist in WebGPU

**Warning signs:**
- Kernel spinlocks never acquire (GPU thread sees stale lock value)
- Flag-based synchronization between threads fails intermittently
- Data races manifest as "impossible" states

**Prevention:**
- Use WebGPU `atomic` operations for ALL shared state (already in codebase)
- Add explicit `workgroupBarrier()` between instruction batches
- Never rely on natural instruction ordering for correctness
- Map CPU `memory_order_seq_cst` to GPU `atomic` operations

**Phase to address:** Memory management phase

**Impact if missed:** Subtle data corruption that only manifests under load

**Existing mitigation in codebase:**
```wgsl
// riscv_executor.wgsl lines 968-986
fn acquire_lock(lock_ptr: ptr<workgroup, atomic<u32>>, max_spins: u32) -> bool {
    for (var spin: u32 = 0u; spin < max_spins; spin = spin + 1u) {
        let result = atomicCompareExchangeWeak(lock_ptr, 0u, 1u);
        if (result.exchanged) { return true; }
    }
    return false;
}
```

---

### 3. GPU Slower Than CPU for Emulation (CRITICAL)

**What goes wrong:** Spending months optimizing GPU execution only to discover CPU emulation is 10x faster.

**Why it happens:**
- Branch divergence kills GPU parallelism (every conditional branch serializes threads)
- Kernel code has HIGH branch density (30-50% of instructions)
- GPU workgroup overhead exceeds single-threaded CPU cost
- Memory latency hidden by CPU cache but exposed on GPU

**Warning signs:**
- GPU executes 100 instructions/frame while CPU emulator does 10,000
- Profiler shows 80% time in `acquire_lock` (contention)
- Adding more workgroups decreases throughput (contention increases)

**Prevention:**
- **Benchmark early** (Phase 1) with representative kernel code
- Profile branch divergence with real Linux boot sequences
- If GPU < 2x CPU speed, reconsider architecture
- Hybrid approach: CPU for control flow, GPU for data parallel operations only

**Phase to address:** Proof-of-concept phase (before committing to GPU-first)

**Impact if missed:** Months of wasted optimization effort

**Research data:**
- [WebGPU Performance Analysis](https://developer.apple.com/cn/videos/play/wwdc2025/236/) - GPU overhead for small batches
- [GPU Memory Consistency Models](https://m.blog.csdn.net/qq_34106574/article/details/155829183) - Sequential consistency cost

---

### 4. Virtual Memory Implementation Impossibility (CRITICAL)

**What goes wrong:** Linux kernel expects real MMU with page tables, TLBs, and page fault handling. Implementing this in GPU shader is impractical.

**Why it happens:**
- SV39/SV48 page tables require multi-level pointer chasing
- Page faults require trap to supervisor mode
- GPU cannot "pause" and resume with different memory mapping
- Each memory access would need page table walk (100x slowdown)

**Warning signs:**
- Attempting to implement `satp` CSR with real page tables
- Page fault handler needs to suspend shader execution
- TLB emulation requires per-thread state

**Prevention:**
- **Don't implement real virtual memory** - use identity mapping
- Guest kernel must be compiled for direct physical addressing
- Trap page fault instructions to host CPU (paravirtualization)
- Use "unified memory" model where guest physical = host virtual

**Phase to address:** Memory layout phase

**Impact if missed:** Non-booting kernel or 100x performance degradation

**Existing code awareness:**
```wgsl
// visual_cpu_riscv.wgsl lines 22-27
const CSR_SATP: u32 = 34u;      // Page table base + mode
// BUT: No actual page table walking implemented - correct approach
```

---

## Moderate Pitfalls

### 5. Interrupt Timing Non-Determinism (MODERATE)

**What goes wrong:** Linux kernel assumes precise timer interrupts. GPU frame boundaries introduce variable latency (16ms at 60fps).

**Why it happens:**
- GPU shaders execute in discrete dispatches
- No way to interrupt shader mid-execution
- Timer interrupts can only be checked between dispatches
- Real-time guarantees impossible in WebGPU

**Warning signs:**
- Timer-dependent kernel code hangs
- SBI timer calls return stale values
- Kernel complains about "unexpected interrupt latency"

**Prevention:**
- Check for pending interrupts between instruction batches
- Implement virtual timer that advances per-instruction, not wall-clock
- Guest kernel must tolerate delayed interrupt delivery
- Use SBI time extension to virtualize timers

**Phase to address:** Trap/interrupt handling phase

**Existing partial mitigation:**
```wgsl
// visual_cpu_riscv.wgsl lines 193-200
fn check_timer_interrupt(base_idx: u32) -> bool {
    // Checks CSR state - but timing is still frame-bound
    let sip = cpu_states[base_idx + CSR_SIP];
    if ((sip & SIP_STIP) == 0u) { return false; }
    // ...
}
```

---

### 6. i64 Emulation Performance (MODERATE)

**What goes wrong:** WebGPU doesn't support 64-bit integers natively. Emulating them in WGSL is slow and error-prone.

**Why it happens:**
- Linux kernel uses `long` (64-bit on RV64) extensively
- WGSL only has `i32`/`u32` and `f32`
- Each i64 operation requires multiple i32 instructions
- Atomic i64 operations require complex lock protocols

**Warning signs:**
- 64-bit arithmetic produces incorrect results
- Atomic 64-bit operations race despite locks
- 10x slowdown on 64-bit heavy code paths

**Prevention:**
- Target RV32 (32-bit RISC-V) instead of RV64
- If RV64 required, use existing i64 emulation layer
- Profile 64-bit operation overhead before committing
- Consider hybrid: 32-bit for control, 64-bit only for data

**Phase to address:** Architecture decision phase

**Existing mitigation in codebase:**
```rust
// riscv_executor.rs lines 6-8
// Phase 48: WGSL i64 Compatibility
use crate::gpu_capabilities::{GpuCapabilities, I64Strategy};
use crate::i64_emulation::generate_i64_emulation_wgsl;
```

---

### 7. Privileged Mode Switching (MODERATE)

**What goes wrong:** RISC-V has U-mode (user) and S-mode (supervisor). Linux switches between them frequently. GPU shader has no concept of privilege levels.

**Why it happens:**
- Privilege transitions require trap handling
- Different CSR visibility per mode
- `sret`/`mret` instructions restore previous mode
- GPU executes all code at same "privilege level"

**Warning signs:**
- U-mode code accesses S-mode CSRs without trap
- `sret` doesn't actually change privilege
- Security-sensitive kernel operations visible to user code

**Prevention:**
- Track privilege mode in software (CSR_MODE variable)
- Check privilege before CSR access (software trap)
- Paravirtualize: guest knows privilege is virtualized
- Don't try to enforce real security boundaries

**Phase to address:** CSR implementation phase

**Existing implementation:**
```wgsl
// visual_cpu_riscv.wgsl lines 25, 165
const CSR_MODE: u32 = 37u;      // Privilege mode (0=user, 1=supervisor)
cpu_states[base_idx + CSR_MODE] = 1u;  // Set MODE to supervisor
```

---

### 8. Browser GPU Timeout (MODERATE)

**What goes wrong:** Long-running GPU compute shaders trigger browser watchdog timeouts (typically 2-10 seconds).

**Why it happens:**
- Browsers assume GPU hangs if shader runs too long
- Watchdog timer resets GPU context
- No way to disable or extend timeout from WebGPU API

**Warning signs:**
- Shader dispatch fails after ~2 seconds
- Browser console shows "GPU process crashed"
- Works for small programs, fails for Linux boot

**Prevention:**
- Limit instruction count per dispatch (100-1000 instructions)
- Yield back to host between batches
- Use progressive execution: dispatch -> check -> dispatch
- Monitor execution time and throttle dynamically

**Phase to address:** Execution loop phase

**Existing pattern:**
```wgsl
// riscv_executor.wgsl line 99
instruction_count: u32,  // Number of instructions to execute this frame
```

---

## Minor Pitfalls

### 9. Device Tree Blob (DTB) Parsing (MINOR)

**What goes wrong:** Linux expects DTB to describe hardware. Parsing DTB in GPU shader is complex and unnecessary.

**Why it happens:**
- DTB is tree-structured binary format
- Requires recursive parsing
- GPU shaders don't have dynamic memory allocation
- Parsing overhead not justified

**Prevention:**
- Parse DTB on CPU, pass simplified config to GPU
- Use fixed hardware configuration for GPU VM
- Guest kernel compiled for known hardware layout

**Phase to address:** Boot configuration phase

---

### 10. Console Output Stuttering (MINOR)

**What goes wrong:** Kernel boot output appears in chunks with delays, making boot feel slower than it is.

**Why it happens:**
- Console buffer only flushed at syscall boundary
- Syscalls only processed between GPU dispatches
- User sees nothing for seconds, then burst of text

**Prevention:**
- Flush console output after every N instructions
- Display partial output during boot
- Show "booting..." animation during silent periods

**Phase to address:** UX polish phase

---

### 11. Debugging Difficulty (MINOR)

**What goes wrong:** GPU shader bugs are extremely hard to debug. No printf, no debugger, only "works or doesn't".

**Why it happens:**
- WGSL has no console output
- GPU state not inspectable mid-execution
- Errors manifest as wrong values with no trace

**Prevention:**
- Extensive logging in host-side code
- Structured execution traces written to buffer
- Reference CPU emulator for comparison testing
- Golden path tests with expected outputs

**Phase to address:** Testing infrastructure phase

**Existing test infrastructure:**
```rust
// tests/golden_path_boot_test.rs
// Validates complete boot flow from LNX bundle
```

---

## Phase-Specific Warnings

| Phase | Likely Pitfall | Mitigation |
|-------|---------------|------------|
| Architecture | GPU-first assumption | Benchmark GPU vs CPU early |
| Memory Layout | Real virtual memory | Use identity mapping from start |
| Instruction Execution | Branch divergence | Profile with real kernel code |
| CSR Implementation | Privilege enforcement | Software-mode tracking, not hardware |
| Trap Handling | Interrupt timing | Virtual timer, frame-bound checks |
| Boot Integration | DTB parsing | CPU parsing, fixed config to GPU |
| Performance Tuning | GPU timeout | Batch execution with yields |
| UX Polish | Console stuttering | Frequent output flushes |

---

## Integration with Existing RISC-V Emulator

The codebase already has a RISC-V emulator in WGSL (`riscv_executor.wgsl`, `visual_cpu_riscv.wgsl`). Key integration considerations:

### What's Already Working:
1. **Atomic lock implementation** (lines 968-986) - handles GPU memory model
2. **Syscall delegation to host** (lines 660-684) - correct paravirtualization pattern
3. **Multi-VM support** (vm_id) - can run multiple instances
4. **Basic profiler** (lines 132-204) - identifies hot blocks for optimization

### What Needs Extension:
1. **Trap handling** - visual_cpu_riscv.wgsl has CSR_STVEC but limited trap_enter
2. **Virtual memory** - CSR_SATP defined but no page table walking
3. **Interrupt delivery** - timer check exists but timing is frame-bound
4. **64-bit support** - i64 emulation layer exists but performance unknown

### Architecture Decision:
- **Option A:** Extend existing WGSL emulator for full Linux boot
  - Pro: Existing code to build on
  - Con: May hit performance wall
- **Option B:** Hybrid CPU-GPU execution
  - Pro: CPU handles control flow, GPU accelerates data ops
  - Con: More complex architecture
- **Option C:** GPU-accelerated JIT translation
  - Pro: Translate hot blocks to native GPU operations
  - Con: Significant engineering effort

**Recommendation:** Start with Option A, benchmark early, pivot to Option B if GPU < 2x CPU speed.

---

## References

### WebGPU Limitations:
- [WebGPU Compute Shader Limitations](https://php.cn/webgpu-compute-shader-limitations) - Browser sandbox, no fine-grained memory management
- [WebGPU Empowering Scene Rendering](https://blog.csdn.net/webgpu-2025) - Driver compatibility, memory management challenges
- [Apple WWDC 2025 GPU Compute](https://developer.apple.com/cn/videos/play/wwdc2025/236/) - Performance optimization patterns

### GPU Memory Model:
- [GPU Memory Consistency Issues](https://m.blog.csdn.net/qq_34106574/article/details/155829183) - Sequential consistency vs GPU weak models
- [NVIDIA PTX Memory Model](https://blog.csdn.net/weixin_42654107/article/details/155225245) - Atomic operations, memory ordering
- [C++26 Memory Model](https://m.blog.csdn.net/pixelisle/article/details/155159705) - Cross-device atomic failures

### GPU-CPU Coherency:
- [Virtual Memory and GPU](https://blog.csdn.net/lsshao/article/details/122688688) - CPU vs GPU MMU differences
- [KVM Shadow MMU](https://blog.csdn.net/weixin_46324627/article/details/135328011) - Virtualization memory management
- [Adreno GPU Security](https://www.4hou.com/index.php/posts/rVwK) - Address translation issues

### RISC-V Implementation:
- [RISC-V Privileged Architecture](https://cloud.tencent.com/developer/article/2337433) - Interrupt/exception handling
- [RISC-V Functional Simulator](https://github.com/euphoric-hardware/riscv-functional-sim) - Reference implementation
- [USTC RISC-V Labs](https://soc.ustc.edu.cn/CECS/lab4/intro/) - Exception handling patterns

### Project-Specific:
- Codebase analysis: riscv_executor.rs, riscv_executor.wgsl, visual_cpu_riscv.wgsl (HIGH confidence)
- Existing tests: golden_path_boot_test.rs, riscv_vm_integration_test.rs (HIGH confidence)
- Build infrastructure: Cargo.toml, build.rs (HIGH confidence)

---

*Research completed: 2026-02-28*
