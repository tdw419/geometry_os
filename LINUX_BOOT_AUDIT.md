# GeOS Linux Boot Audit

Device-by-device assessment of what exists vs what Linux expects.
Goal: boot a Linux kernel inside the GeOS RISC-V hypervisor.

## Executive Summary

GeOS has a solid foundation: all major device categories exist, SBI is extensive,
the DTB generator is custom-built, and boot_linux_setup() already exists with
kernel patching infrastructure. The system has clearly been pushed toward Linux
boot already (the boot.rs patches for setup_vm, calibrate_delay, udelay, etc.).

**The single biggest gap: the CPU is RV32 only. Linux mainline is RV64.**

RV32 Linux exists but is niche (only nommu or specialized configs). The MISA
register is hardcoded to RV32I. All registers are u32. The MMU is Sv32 only.
Getting RV64 Linux running means either:
  (a) Adding RV64 to the hypervisor (big lift)
  (b) Booting RV32 Linux (limited, requires nommu or rv32 defconfig)

**Recommended path: Start with RV32 Linux (nommu or tiny config) to validate
all device emulation, then add RV64 later for full compatibility.**

---

## Gap Analysis by Device

### 1. CPU (src/riscv/cpu/)
**Current:** RV32IMAC, u32 registers, Sv32 MMU
**Linux needs:** RV64IMA (Sv39 MMU) for mainstream, or RV32I (Sv32) for niche

| Gap | Effort | Priority |
|-----|--------|----------|
| All registers are `u32` -- need `u64` for RV64 | Large (touch every file) | P1 if going RV64 |
| No RV64 instruction decode (W suffix ops, LD/SD/LWU) | Medium | P1 if going RV64 |
| Sv39 MMU (3-level page tables, 64-bit PTEs) | Large | P1 if going RV64 |
| MISA hardcoded to `MISA_RV32I` (0x40000100) | Small | P1 |
| C extension decode exists (compressed.rs) | Done | -- |
| A extension exists (LR.W/SC.W/AMO*) | Done | -- |
| M extension exists | Done | -- |
| No F/D extension (floating point) | Large | P3 (Linux works without FPU) |

**For RV32 Linux path:** CPU is mostly ready. Need to ensure MISA reports
correct extensions (IMAC). Sv32 MMU already exists and works.

### 2. CLINT (src/riscv/clint.rs)
**Current:** SiFive CLINT layout, mtime + mtimecmp + msip
**Linux expects:** Same SiFive CLINT at 0x02000000

| Gap | Effort | Priority |
|-----|--------|----------|
| Address map matches QEMU virt | Done | -- |
| mtime 64-bit counter | Done | -- |
| mtimecmp per hart | Done (hart 0 only) | -- |
| msip register | Done | -- |
| Multi-hart mtimecmp | Missing | P2 (single-hart works) |

**Verdict: CLINT is Linux-ready for single hart.**

### 3. PLIC (src/riscv/plic.rs)
**Current:** 32 sources, single context, priority/enable/threshold/claim/complete
**Linux expects:** Full PLIC with S-mode and M-mode contexts

| Gap | Effort | Priority |
|-----|--------|----------|
| Only context 0 (M-mode S-mode context) | Medium | P1 |
| QEMU virt has context 1 at 0x0C20_1000+ | Missing | P1 |
| Enable registers span 0x0C00_2000-0x0C00_3000 | Only one word | P1 |
| Pending at 0x0C00_1000 (not 0x0C00_0200!) | Wrong address | P1 |
| 1536 IRQ sources (QEMU virt default) | Only 32 | P2 (may work with 32) |
| Multiple enable register words | Single word | P1 |

**Key bug: PENDING_BASE is 0x0C00_1000 in the code but the DTB likely
advertises the standard offset. Linux's PLIC driver reads pending at
the standard QEMU offset. Need to verify DTB matches PLIC layout.**

**Verdict: PLIC needs multi-context support and address fix. Medium effort.**

### 4. UART (src/riscv/uart.rs)
**Current:** NS16550A at 0x10000000, 8 registers, DLAB, FIFO
**Linux expects:** 8250/16550A compatible

| Gap | Effort | Priority |
|-----|--------|----------|
| Standard register map | Done | -- |
| THR/RBR, IER, IIR/FCR, LCR, MCR, LSR, MSR, SCR | Done | -- |
| DLAB divisor latch access | Done | -- |
| FIFO (FCR) writes accepted | Done | -- |
| Interrupt generation (IIR) | Partial | P2 |
| Byte-level bus access | Done | -- |
| Word-level read_word bus integration | Done | -- |

**Verdict: UART is Linux-ready. The 8250 driver is very forgiving.**

### 5. VirtIO Block (src/riscv/virtio_blk.rs)
**Current:** Full VirtIO 1.0 MMIO transport, virtqueue processing
**Linux expects:** VirtIO MMIO 1.0 with virtqueue ring processing

| Gap | Effort | Priority |
|-----|--------|----------|
| Magic/Version/DeviceID/VendorID | Done | -- |
| Feature negotiation | Done | -- |
| Queue setup (desc/avail/used rings) | Done | -- |
| QUEUE_NOTIFY -> process request | Done | -- |
| Config space (capacity) | Done | -- |
| Interrupt on completion | Partial | P1 |
| Segmented descriptors (chained) | Need to verify | P2 |
| VIRTIO_BLK_F_BLK_SIZE feature | Missing | P3 |
| 64-bit queue addresses (QueueDescHigh etc) | Need to verify | P1 for RV64 |

**Verdict: VirtIO-blk is close. Verify chained descriptors and interrupt delivery.**

### 6. VirtIO Net (src/riscv/virtio_net.rs)
**Current:** VirtIO MMIO network device with TX/RX

| Gap | Effort | Priority |
|-----|--------|----------|
| Basic MMIO transport | Done | -- |
| TX/RX virtqueue processing | Done | -- |
| Network backend (host TCP) | Done | -- |
| Interrupt on RX | Partial | P1 |
| VIRTIO_NET_F_MAC feature | Done | -- |
| Multi-queue support | Missing | P3 (single queue works) |

**Verdict: Similar to virtio-blk. Close.**

### 7. VirtIO GPU (src/riscv/virtio_gpu.rs)
**Current:** 1808 lines, full VirtIO GPU protocol
**Linux expects:** virtio-gpu driver with scanout + resource management

| Gap | Effort | Priority |
|-----|--------|----------|
| Full VirtIO GPU protocol | Done | -- |
| Resource create/attach/transfer | Done | -- |
| Scanout (set_scanout, resource_flush) | Done | -- |
| Display info response | Done | -- |
| Cursor support | Missing | P3 |

**Verdict: VirtIO GPU is likely Linux-ready.**

### 8. MMU (src/riscv/mmu.rs)
**Current:** Sv32 only, TLB with ASID, page fault generation

| Gap | Effort | Priority |
|-----|--------|----------|
| Sv32 page table walk | Done | -- |
| PTE flags (V/R/W/X/U/G/A/D) | Done | -- |
| TLB with ASID-aware invalidation | Done | -- |
| Page fault traps | Done | -- |
| Sv39 (for RV64 Linux) | Missing | P1 if going RV64 |
| NBPM (Napot-based page table) | Missing | P3 |

**For RV32 Linux: Sv32 is complete.**
**For RV64 Linux: Need full Sv39 implementation.**

### 9. SBI (src/riscv/sbi.rs)
**Current:** Extensive SBI implementation with many extensions

| Gap | Effort | Priority |
|-----|--------|----------|
| SBI v0.1 legacy (putchar/getchar) | Done | -- |
| SBI BASE extension | Done | -- |
| SBI TIME (timer) | Done | -- |
| SBI IPI | Missing impl | P2 |
| SBI RFENCE | Missing impl | P2 |
| SBI HSM (hart start/stop) | Partial | P2 |
| SBI SRST (system reset) | Done | -- |
| SBI DBCN (debug console) | Done | -- |
| SBI STA (suspension) | Declared | P3 |
| SBI PMU | Missing | P2 (Linux probes, falls back) |

**Verdict: SBI is solid. Linux will probe missing extensions and fall back.
The critical ones (BASE, TIME, SRST, DBCN) are done.**

### 10. DTB Generator (src/riscv/dtb.rs)
**Current:** Custom hand-built FDT generator, 528 lines

| Gap | Effort | Priority |
|-----|--------|----------|
| Valid FDT structure | Done | -- |
| CPU node, memory node | Done | -- |
| UART, CLINT, PLIC nodes | Done | -- |
| VirtIO device nodes | Done | -- |
| chosen node with stdout-path | Done | -- |
| initrd-start/end support | Done | -- |
| bootargs support | Done | -- |
| interrupt-parent mapping | Done | -- |
| memory-reservation entries | Done | -- |

**Verdict: DTB generator is Linux-ready.**

### 11. Boot Infrastructure (src/riscv/boot.rs)
**Current:** boot_guest() and boot_linux_setup() with kernel patching

| Gap | Effort | Priority |
|-----|--------|----------|
| ELF32 loading | Done | -- |
| ELF64 loading (addresses truncated to u32) | Done | -- |
| DTB placement | Done | -- |
| Initrd loading | Done | -- |
| Kernel page table fixup | Done | -- |
| setup_vm() patches | Done (hardcoded offsets!) | P1 (fragile) |
| calibrate_delay patch | Done (hardcoded!) | P1 (fragile) |
| udelay patch | Done (hardcoded!) | P1 (fragile) |
| riscv_timebase preset | Done | -- |

**Key concern: boot.rs has ~6 hardcoded physical addresses for kernel patching.
These are specific to ONE kernel build. Changing the kernel or compiler version
will break them. This needs a more robust approach (pattern matching or
config-driven offsets).**

### 12. Memory (src/riscv/memory.rs)
**Current:** Flat Vec<u8>, byte/half/word access

| Gap | Effort | Priority |
|-----|--------|----------|
| Flat RAM with base address | Done | -- |
| Byte/half/word read/write | Done | -- |
| RAM at 0x80000000 | Done | -- |
| 64-bit access for RV64 | Missing | P1 if going RV64 |

### 13. CSR Bank (src/riscv/csr/)
**Current:** Full M-mode and S-mode CSR set

| Gap | Effort | Priority |
|-----|--------|----------|
| mstatus, mtvec, mepc, mcause, mtval | Done | -- |
| sstatus, stvec, sepc, scause, stval | Done | -- |
| satp (Sv32 mode) | Done | -- |
| mie/mip, sie/sip | Done | -- |
| medeleg/mideleg | Done | -- |
| misa | Done (RV32I only) | P1 |
| stimecmp (Sstc extension) | Missing | P2 (SBI timer works) |

---

## Priority Roadmap for "Boot Linux"

### Phase 1: RV32 Linux Validation (2-3 weeks)
Boot a small RV32 Linux kernel (nommu or tinyconfig) using existing infrastructure.

1. **Build a minimal RV32 Linux kernel** for the GeOS virt machine
   - Use rv32_defconfig or nommu config
   - Ensure device addresses match DTB
   - Effort: 2-3 days

2. **Fix PLIC multi-context** (S-mode context at 0x0C20_1000)
   - Linux PLIC driver expects two contexts per hart
   - Effort: 1-2 days

3. **Make boot patches configurable** instead of hardcoded
   - Load patch offsets from a config file or find them by pattern matching
   - Effort: 2-3 days

4. **Verify VirtIO interrupt delivery**
   - Ensure block/net devices properly signal PLIC on completion
   - Effort: 1-2 days

5. **Test: kernel prints to console via UART**
   - First milestone: see Linux boot messages
   - Effort: 1 day

### Phase 2: RV64 Linux (4-6 weeks)
The real goal. Run mainstream RV64 Linux.

1. **Add RV64 register file** (u64 everywhere)
   - Touches cpu/, decode/, alu/, loadstore.rs, system.rs
   - Largest single change
   - Effort: 2-3 weeks

2. **Add RV64 instruction decode**
   - LD, SD, LWU, ADDIW, SLLIW, SRLIW, SRAIW, W-suffix ALU ops
   - Effort: 1 week

3. **Implement Sv39 MMU**
   - 3-level page tables, 64-bit PTEs, 48-bit VA space
   - Effort: 1-2 weeks

4. **64-bit bus access**
   - read_doubleword / write_doubleword for LD/SD
   - Effort: 2-3 days

5. **Update DTB for RV64**
   - #address-cells = 2, #size-cells = 2
   - Effort: 1 day

6. **Update MISA for RV64**
   - MXL field = 0b10 (bits 31:30)
   - Effort: trivial

### Phase 3: Full Linux Userspace (2-3 weeks)
Once the kernel boots, get userspace working.

1. **Root filesystem on VirtIO-blk**
   - Create a disk image with ext2/initramfs
   - Effort: 2-3 days

2. **VirtIO-net for network access**
   - Verify TCP stack works end-to-end
   - Effort: 2-3 days

3. **Shell, busybox, or dropbear**
   - Standard Linux userspace
   - Effort: 1 day (just packaging)

4. **Multi-hart support** (optional)
   - SBI HSM for secondary hart bringup
   - Effort: 1 week

---

## What QEMU Source Would Help With

For each device, the relevant QEMU reference files:

| Device | QEMU Source | What to Study |
|--------|-------------|---------------|
| PLIC | hw/intc/sifive_plic.c | Multi-context enable/threshold/claim layout |
| VirtIO | hw/virtio/virtio-mmio.c | Exact MMIO register sequence Linux driver expects |
| CLINT | hw/intc/sifive_clint.c | Multi-hart mtimecmp layout |
| Boot | hw/riscv/virt.c | Machine creation, DTB generation, address map |
| CPU | target/riscv/ | Sv39 page table walk, RV64 decode |

These are reference reads, not runtime dependencies.
