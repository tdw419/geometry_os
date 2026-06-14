# Booting Linux on the Geometry OS RISC-V VM

## Overview

Geometry OS includes a software-emulated 32-bit RISC-V CPU (RV32IMAC) capable of
running a real Linux kernel. This document records the full journey: what we
built, what broke, how we diagnosed it, and what remains.

The goal: boot Linux 6.14 (RV32) inside the GeOS VM, reach userspace (init from
an initramfs), and eventually run the full GeOS desktop -- all guest-native,
no host OS dependency beyond the GeOS runtime itself.

---

## Architecture

```
+----------------------------------------------------------+
|  GeOS Host (Rust, 254K+ LOC)                             |
|                                                          |
|  +-----------------------------------------------------+ |
|  | RiscvVm                                              | |
|  |  - RV32IMAC CPU (src/riscv/cpu/)                     | |
|  |  - Sv32 MMU (src/riscv/mmu.rs)                       | |
|  |  - Bus with devices (src/riscv/bus.rs)               | |
|  |    +-- RAM: 0x80000000+ (up to 512MB)                | |
|  |    +-- CLINT: timer (mtime/mtimecmp)                  | |
|  |    +-- UART: 16550-compatible                         | |
|  |    +-- Framebuffer: 256x256 RGBA                      | |
|  |    +-- VirtIO Block (optional)                        | |
|  |    +-- SBI emulator (src/riscv/sbi.rs)               | |
|  |  - Kernel patch engine (src/riscv/kernel_patches.rs)  | |
|  |  - DTB generator (src/riscv/dtb.rs)                   | |
|  +-----------------------------------------------------+ |
|                                                          |
|  Guest: Linux 6.14 RV32 (vmlinux ELF)                   |
|  No OpenSBI -- GeOS emulates SBI directly                |
+----------------------------------------------------------+
```

### Key Design Decisions

**No OpenSBI firmware.** On real hardware, the boot flow is:
M-mode firmware (OpenSBI) -> S-mode kernel. In GeOS, we skip the firmware
entirely. The VM sets up the same state that OpenSBI would (page tables,
delegation registers, DTB pointer) and enters the kernel directly in S-mode
via a simulated `mret`. The SBI emulator in `sbi.rs` handles all ECALL requests
that the kernel makes.

**Sv32 page tables pre-built.** Linux expects to run at virtual addresses
(0xC0000000+ for RV32). We create a preliminary Sv32 page table before
starting the kernel:
  - Identity mapping: VA 0x80000000 -> PA 0x80000000 (256 entries, 1GB)
  - Kernel mapping: VA 0xC0000000 -> PA 0x80000000 (64 entries, 256MB)

The kernel later replaces these with its own page tables during `setup_vm()`.

**Kernel binary patching.** Since we don't run OpenSBI, certain kernel
assumptions must be corrected at load time. The `KernelPatches` system
supports two patch strategies:
  1. **Data patches**: Write correct values to known kernel symbols
     (DTB addresses, timebase, loops_per_jiffy, etc.)
  2. **Instruction patches**: Pattern-scan the kernel binary for known
     instruction sequences and NOP-out or redirect them (setup_vm page
     table writes, calibrate_delay loops, ebreak instructions in rwsemaphores)

---

## What We Built (Chronological)

### Phase 1: Basic CPU and Memory

The RV32IMAC CPU emulator handles:
- All base integer instructions (RV32I)
- Multiply extension (M): MUL, MULH, DIV, REM, etc.
- Atomic extension (A): LR/SC, AMO operations
- Compressed extension (C): 16-bit instruction encoding
- CSR read/write with full privilege model (M/S/U)
- Trap delivery: `deliver_trap()` checks medeleg/mideleg to route traps

### Phase 2: Bus and Devices

The bus (`src/riscv/bus.rs`) provides a memory-mapped address space:
- **RAM**: Configurable base (0x80000000 for Linux) and size
- **CLINT** (Core Local Interruptor): `mtime` and `mtimecmp` registers
  for timer interrupts. Timer fires when `mtime >= mtimecmp`.
- **UART**: 16550-compatible serial port for console I/O
- **Framebuffer**: 256x256 pixel device at MMIO address
- **SBI**: Not a real device -- ECALLs are intercepted by the CPU's
  system instruction handler and dispatched to `sbi.rs`

### Phase 3: ELF Loader and DTB Generator

**ELF loader** (`src/riscv/loader.rs`):
- Parses ELF32 headers, loads PT_LOAD segments at physical addresses
- Supports both standard ELF and GeOS's pixel-packed ELF format
- Reports entry point and highest loaded address

**DTB generator** (`src/riscv/dtb.rs`):
- Creates a minimal Flattened Device Tree describing the machine
- Memory layout, CPU, CLINT timebase frequency, UART, interrupt mapping
- Bootargs passed via DTB (not command line)
- Initrd addresses embedded in DTB when initramfs is provided

### Phase 4: SBI Emulation

The SBI emulator (`src/riscv/sbi.rs`) handles these extensions:
- **Base (0x10)**: spec version, implementation ID ("GEOS"), probe extension
- **Timer (TIME)**: SET_TIMER -- programs CLINT mtimecmp
- **DBCN (Console)**: write/write_byte for kernel console output
- **SRST**: system reset (shutdown)
- **HSM**: hart start/stop/status (minimal)
- **IPI, RFENCE**: inter-processor interrupts, TLB flushes (stubs)
- **Geometry (GEOM)**: custom extension for framebuffer, GPU, input, VFS
- **JIT Driver**: specless device driver synthesis (custom)
- **Legacy v0.1**: putchar/getchar for early console

### Phase 5: Kernel Patching

The kernel patch system (`src/riscv/kernel_patches.rs`) addresses these issues:

1. **DTB pointers**: The kernel reads `_dtb_early_va` and `_dtb_early_pa`
   very early. We write the correct physical and virtual addresses.

2. **setup_vm page table writes**: The kernel's `setup_vm()` creates its own
   page tables. Since we already set SATP with a working page table, these
   writes would corrupt the mapping. We NOP-out the SATP write in setup_vm.

3. **Timebase frequency**: Written to the `riscv_timebase` kernel variable
   (10MHz default).

4. **loops_per_jiffy**: Pre-set to a reasonable value so the kernel doesn't
   spend millions of instructions calibrating the delay loop.

5. **calibrate_delay / udelay / ndelay**: These timing-sensitive functions
   don't work correctly in a variable-speed emulator. We NOP-out or stub them.

6. **ebreak in rwsemaphores**: The kernel has `BUG()` calls (ebreak) in
   `up_read()` and `down_read_trylock()` that fire during boot. We patch
   these to NOPs since they're false positives in our emulated environment.

7. **memblock setup**: Pre-populate the kernel's memblock structure with
   correct memory regions to avoid overlap errors.

8. **Initrd overlap bypass**: If initrd placement overlaps with memblock
   allocations, patch the kernel's overlap check to succeed anyway.

Patches can come from:
- **Default hardcoded addresses**: For the specific vmlinux build
- **System.map parsing**: `from_system_map()` loads symbol addresses from
  the kernel's System.map file, making patches work across kernel builds

### Phase 6: Boot Sequence

The boot flow (`src/riscv/boot.rs`, `boot_linux_setup_with_patches()`):

```
1. Calculate minimum RAM from kernel ELF segments
2. Create VM with ram_base=0x80000000
3. Load kernel ELF into RAM at physical addresses
4. Generate DTB, place at top of RAM - 1MB
5. Load initrd just after kernel (kernel_phys_end + 2MB)
6. Apply kernel patches (data + instruction)
7. Build preliminary Sv32 page table:
   - Identity: 0x80000000 -> 0x80000000
   - Kernel:   0xC0000000 -> 0x80000000
   - Set SATP to enable MMU
8. Set up privilege model:
   - mideleg: delegate timer/software/external to S-mode
   - medeleg: delegate page faults + ECALL_U + breakpoint to S-mode
   - CAUSE_ECALL_S NOT delegated (SBI must go to M-mode)
   - CAUSE_ILLEGAL_INSTRUCTION NOT delegated
9. Enter kernel in S-mode:
   - mepc = kernel virtual entry (0xC0000000+)
   - mstatus.MPP = Supervisor
   - Simulate mret -> PC = entry, privilege = S-mode
10. Set a0=0 (hartid), a1=DTB_PA (standard RISC-V boot convention)
```

The instruction loop (`boot_linux_with_patches()`, lines 386-529):
```
for each instruction:
    tick CLINT timer (1 tick per 1000 instructions)
    sync_mip() to update pending interrupts
    call vm.step()
    handle step result (Ok, Ecall, Ebreak, Faults)
    log diagnostics (PC tracking, S->M trap detection, watchpoints)
```

### Phase 7: Diagnostic Tool

`ollama_linux_boot.rs` -- an LLM-assisted diagnostic tool:
1. Boots the kernel for N instructions (default 100M)
2. Captures: SBI ecall log, console output, register state, PC histogram,
   fault counts, CLINT timer state
3. Feeds all diagnostics to a local Ollama model
4. Asks the model to identify the failure mode and suggest fixes
5. Can iterate with targeted diagnostics

This tool was instrumental in finding both major issues (timer interrupt storm
and SBI ECALL handling gap).

---

## What Broke and How We Fixed It

### Issue 1: Timer Interrupt Storm

**Symptom**: The kernel booted to "bootconsole [sbi0] disabled" but then
stalled. Over 43,000 SBI timer calls (SET_TIMER) in 100M instructions with
no forward progress. The kernel was stuck in a timer cancel/reschedule loop.

**Root cause**: The CLINT timer tick rate was way too fast relative to the
emulated instruction throughput. We were ticking mtime by 100,000 per 1000
instructions. At ~50 MIPS (debug build), this made mtime advance at ~5GHz,
but the kernel's timebase was configured as 10MHz. So mtime ran 500x too
fast. The timer interrupt fired before the kernel could finish scheduling
`kernel_init`, causing an infinite timer-handling loop.

**Fix**: Changed CLINT tick rate to 1 tick per 1000 instructions (line 430
in boot.rs). This gives an effective timebase of ~50KHz at 50 MIPS -- slower
than 10MHz, but the kernel handles a slow clock gracefully. A fast clock
causes an interrupt storm.

```rust
// Before (100K ticks per 1000 instructions = ~5GHz effective):
if count % 1000 == 0 {
    vm.bus.tick_clint_n(100_000);
}

// After (1 tick per 1000 instructions = ~50KHz effective):
if count % 1000 == 0 {
    vm.bus.tick_clint_n(1);
}
```

### Issue 2: SBI ECALL Not Intercepted in Boot Loop (FIXED)

**Symptom**: After the CLINT rate fix, the kernel regressed. It boots
successfully (full console output to "bootconsole [sbi0] disabled") but then
gets stuck in M-mode. The CPU loops at 0x800010B2 (the BSS zeroing code in
`_start_kernel`) with a3 pointing inside the BSS range.

**Root cause**: The kernel boots in S-mode and makes SBI calls (ECALL from
S-mode = CAUSE_ECALL_S). Since CAUSE_ECALL_S is NOT in medeleg (by design --
SBI calls must trap to M-mode), these ECALLs trap to M-mode. But `mtvec` was
pointed at 0x80000000 (kernel entry), so every SBI call restarted the kernel.

The boot loop (`boot.rs`) ignored `StepResult::Ecall` entirely, while the
live hypervisor (`live.rs`) had correct trap forwarding.

**Fix**: Ported the live.rs trap forwarding pattern to the boot loop. When
the CPU traps to M-mode with an S-mode ECALL, the boot loop now intercepts
it, calls `sbi.handle_ecall()`, sets return values, advances PC past the
ECALL, and returns to S-mode. This made the kernel boot past the SBI
stall and into `kernel_init_freeable()`.

### Issue 3: vmalloc Page Fault at 0xA0000000 (CURRENT)

**Symptom**: The kernel boots through the full early init sequence --
console output, memory setup, scheduler, clocksource, devtmpfs -- but crashes
with a load access fault during `dma_atomic_pool_init()`:

```
[    0.151451] Oops - load access fault [#1]
[    0.152827] epc : __vmap_pages_range_noflush+0xc0/0x176
[    0.153719]  ra : vmap+0x6c/0xc8
[    0.154525] epc : c00994a6 ra : c009a040 sp : 81837de0
[    0.156078]  s1 : 60000000 a0 : a0000000 a1 : 00000000
[    0.156569]  a2 : a0400000 a3 : 81822000 a4 : a0000000
[    0.159945] status: 00000120 badaddr: a0000000 cause: 00000005
[    0.161444] [<c009a040>] vmap+0x6c/0xc8
[    0.162367] [<c004eee2>] dma_common_contiguous_remap+0x5a/0x78
[    0.163426] [<c004eae2>] atomic_pool_expand+0x70/0x172
[    0.164437] [<c0408480>] dma_atomic_pool_init+0xa8/0x122
```

**Root cause analysis**: The kernel's vmalloc space starts at 0xA0000000
(for RV32 with PAGE_OFFSET=0xC0000000). During DMA pool initialization,
the kernel calls `vmap()` to create virtual mappings in the vmalloc range.
The function `__vmap_pages_range_noflush` writes page table entries mapping
vmalloc addresses (VA 0xA0000000-0xA0400000) to physical pages.

The fault at badaddr=0xA0000000 means the emulator's MMU page table walk
fails when translating this vmalloc address. The Sv32 walk must:
1. Look up the L1 page table entry for vpn1=0x280 (VA 0xA0000000 >> 22)
2. Follow the L1 PTE to find the L2 page table
3. Look up the L2 PTE for vpn2=0x000
4. Extract the PPN from the L2 PTE
5. Compute PA = (PPN << 12) | page_offset

The crash happens because the page table walker in `mmu.rs` doesn't correctly
handle vmalloc-range PTEs. The kernel creates these PTEs at runtime (not
during setup_vm), so they're distinct from the identity/kernel mappings we
pre-built. The PPN fixup system (which adjusts PPNs for kernel virtual
addresses >= 0xC0000000) may also be incorrectly modifying vmalloc PTEs
that should map to real physical pages.

The MMU already has a vmalloc identity map fallback: when VA is in range
0x80000000-0xBFFFFFFF and the L1 entry is invalid, it computes
guest_pa = ram_base + (va - 0x80000000). But 0xA0000000 is *within* this
range, yet the fault still occurs, suggesting the fallback isn't being
reached (perhaps the L1 entry exists but points to a bad L2 table).

**Honest assessment**: Ollama (qwen2.5-coder:14b) can correctly identify
WHERE the crash is (mmu.rs, 0xa0000000) but its fix suggestions are generic
and sometimes hallucinated (suggesting kernel C code changes instead of
Rust emulator fixes). The actual fix requires a cloud model to read mmu.rs,
understand the Sv32 walk logic, and identify the PPN handling gap.

---

## Autonomous Debug Infrastructure

To accelerate the vmalloc fix, we built an autonomous debug loop that combines
local Ollama diagnosis with cloud-model code fixes:

### Scripts

| Script | Purpose |
|--------|---------|
| `scripts/linux_boot_once.sh` | Build + boot + save crash state (no Ollama) |
| `scripts/linux_boot_loop.sh` | Build + boot + Ollama diagnosis + save |
| `scripts/linux_boot_auto.sh` | Full pipeline: build + boot + extract kernel log + Ollama diagnosis |

All scripts write state to `.geometry_os/boot_loop/`:

```
.geometry_os/boot_loop/
  BOOT_STATUS.md       -- Human + agent readable summary (READ THIS FIRST)
  BOOT_STATE.json      -- Machine-readable milestones, score, crash, registers
  status               -- CRASH / SUCCESS / IDLE_NO_INIT / NO_OUTPUT / BUILD_FAILURE
  boot_output.txt      -- Raw emulator output (SBI + UART + DBCN bytes)
  kernel_log.txt       -- Extracted readable kernel messages
  crash_section.txt    -- The Oops/panic section
  registers.txt        -- Register dump at crash
  ollama_diagnosis.md  -- Ollama's analysis (local model)
  fix_history.md       -- Record of all fix attempts + outcomes
  iteration            -- Counter
  loop.log             -- Timestamped log
```

The key improvement: **boot scoring**. After each boot, `boot_milestones.py`
parses the kernel log against 20 known milestones (kernel entry, SBI detected,
memory setup, devtmpfs, DMA pool, VFS mount, init, shell) and computes a
score from 0-100. The BOOT_STATE.json includes a comparison with the previous
run, so the agent immediately knows whether a fix helped (score went up),
hurt (score went down / regression), or had no effect.

Every Hermes session or cron run starts by reading BOOT_STATUS.md for instant
context -- no need to re-parse raw logs.

### Cron Job: `linux-boot-debug`

A Hermes cron job that runs every 15 minutes (up to 10 times total, currently
paused). Each run:

1. Boots Linux via `linux_boot_once.sh` (~90 seconds)
2. Reads the crash output from `.geometry_os/boot_loop/`
3. Analyzes the Rust emulator code (mmu.rs, cpu.rs, bus.rs)
4. Applies a code fix
5. Repeats up to 5 iterations per cron run

The prompt is at `~/.hermes/prompts/linux_boot_auto_debug.txt`. It includes:
- Architecture context (RV32, Sv32, RAM layout, vmalloc range)
- The known bug pattern (vmalloc PPN handling)
- All previously-fixed issues (so the model doesn't re-fix them)
- Safety rules (max 5 iterations, stop on build failures, never overwrite logs)

### Division of Labor

```
Ollama (qwen2.5-coder:14b, local)          Cloud model (Hermes cron)
  - Identifies crash location               - Reads full Rust source
  - Extracts badaddr / epc / call trace     - Understands Sv32 walk logic
  - Confidence: WHERE but not HOW           - Applies precise code fix
  - ~160 tok/s, free, immediate             - Expensive, 15-min intervals
```

---

## Current State

```
                    Boot Progress
    +----------------------------------------------+
    | 1. Kernel loads and maps                  DONE|
    | 2. setup_vm + early boot                  DONE|
    | 3. Console output (SBI DBCN)              DONE|
    | 4. Scheduler starts                       DONE|
    | 5. Timer interrupts work                  DONE|
    | 6. "bootconsole [sbi0] disabled"          DONE|
    | 7. Post-console SBI calls                 DONE|
    | 8. Memory allocator, devtmpfs             DONE|
    | 9. dma_atomic_pool_init (vmalloc)         FAIL <-- vmalloc PPN bug
    | 10. Kernel init / userspace            BLOCKED|
    +----------------------------------------------+
```

The kernel successfully boots through the entire early init sequence:
- Loads at PA 0x80000000, mapped at VA 0xC0000000
- Console output via SBI DBCN (full dmesg)
- Memory setup: 496168K/524288K available
- Scheduler, clocksource, pid_max, ASID allocator
- devtmpfs initialized

It crashes during `dma_atomic_pool_init()` -> `atomic_pool_expand()` ->
`dma_common_contiguous_remap()` -> `vmap()` -> `__vmap_pages_range_noflush()`.
The fault is a load access fault at badaddr=0xA0000000 (vmalloc space).

The fix is in `src/riscv/mmu.rs` -- the Sv32 page table walker must correctly
handle vmalloc-range PTEs that the kernel creates at runtime.

---

## Key Files

| File | Purpose |
|------|---------|
| `src/riscv/mmu.rs` | Sv32 page table walk, PPN fixup, TLB, vmalloc fallback |
| `src/riscv/bus.rs` | Bus routing, PTE write interception, page table fixup |
| `src/riscv/boot.rs` | Kernel loading, DTB generation, boot page tables |
| `src/riscv/sbi.rs` | SBI emulator (timer, console, DBCN) |
| `src/riscv/live.rs` | Live hypervisor with working SBI forwarding |
| `src/riscv/mod.rs` | RiscvVm struct, new_with_base() |
| `src/riscv/cpu/system.rs` | ECALL/SRET/MRET/CSR instruction handling |
| `src/riscv/cpu/mod.rs` | CPU core, step(), deliver_trap() |
| `src/riscv/kernel_patches.rs` | Configurable kernel binary patcher |
| `src/riscv/dtb.rs` | Device tree blob generator |
| `src/riscv/loader.rs` | ELF loader |
| `src/bin/ollama_linux_boot.rs` | LLM-assisted diagnostic tool |
| `scripts/linux_boot_once.sh` | Single boot attempt + crash state |
| `scripts/linux_boot_auto.sh` | Full boot + Ollama diagnosis pipeline |
| `scripts/linux_boot_loop.sh` | Iterative boot + Ollama diagnosis loop |
| `scripts/boot_milestones.py` | Parse kernel log into structured milestones + boot score |

---

## Lessons Learned

1. **Timer rate matters enormously.** An emulator's instruction throughput
   is orders of magnitude slower than real hardware. If mtime advances faster
   than the kernel can handle timer interrupts, you get a livelock. The fix
   was counterintuitive: slow the clock *down*, not up.

2. **mtvec is a loaded gun.** Pointing mtvec at the kernel entry point means
   any M-mode trap restarts the kernel. This was fine for bare-metal GeOS
   programs but fatal for Linux, which makes regular SBI calls (M-mode traps).

3. **Two execution paths, two bugs.** The live hypervisor (live.rs) and the
   boot function (boot.rs) have separate instruction loops. The live
   hypervisor was built first and has the correct SBI forwarding. The boot
   function was built for simpler bare-metal use and lacks it. When you have
   two code paths, both must be tested with the full guest workload.

4. **Diagnostics beat guessing.** The ollama_linux_boot tool (100M instruction
   runs with full ecall/PC/register dumps) made it possible to identify the
   timer storm (43K+ SET_TIMER calls with no progress) and the M-mode restart
   (PC stuck at BSS zeroing with mtvec=kernel_entry). Without it, we'd be
   guessing.

5. **Kernel patching is an art.** The Linux kernel has many assumptions about
   hardware timing, memory layout, and firmware behavior. Patching a running
   kernel's binary in-memory requires understanding both what it expects and
   what your emulator actually provides. The configurable KernelPatches system
   with System.map loading makes this reproducible across kernel builds.

6. **Local LLMs find the crime scene but can't solve the crime.** Ollama
   (qwen2.5-coder:14b) reliably identifies WHERE the crash is (which file,
   which address, which function). But it hallucinates fixes -- suggesting
   kernel C code changes or generic "add validation" patterns instead of the
   specific Rust emulator code change needed. The division of labor (local
   diagnosis, cloud fix) is the right pattern.

7. **The vmalloc range is the hardest MMU test.** Identity mappings (VA==PA)
   and kernel mappings (VA 0xC0000000 -> PA 0x80000000) are set up once during
   boot and never change. Vmalloc mappings are created dynamically by the
   kernel at runtime, with PTEs the emulator has never seen before. The PPN
   fixup system must handle these correctly without corrupting them.

---

## Next Steps

1. **Fix vmalloc PPN handling in mmu.rs.** The Sv32 page table walker must
   correctly translate vmalloc-range addresses (VA 0xA0000000+). The PPN
   fixup system that adjusts kernel virtual PPNs may be incorrectly
   modifying vmalloc PTEs. Read mmu.rs, understand the walk, find the gap.

2. **Boot to userspace.** Once vmalloc works, the kernel should complete
   DMA pool init and continue through the rest of kernel_init. This may
   surface more issues (VFS, scheduler, driver expectations).

3. **Run the GeOS desktop.** The initramfs should launch the GeOS window
   manager / desktop environment, which uses the GEOM SBI extension for
   framebuffer access, input, and VFS.

4. **Performance.** The debug build runs at ~50 MIPS. A release build should
   be significantly faster. The CLINT tick rate may need adjustment at higher
   throughput to match real timebase frequency.

5. **SMP support.** Currently single-hart only. The kernel is booted with
   `nosmp`. Multi-core support requires HSM (Hart State Management) SBI
   extension and per-hart CPU state.

6. **Merge boot paths.** The live hypervisor (live.rs) and boot function
   (boot.rs) share most of their logic but diverge in the instruction loop.
   They should share a common loop implementation to prevent bugs from
   existing in one but not the other.
