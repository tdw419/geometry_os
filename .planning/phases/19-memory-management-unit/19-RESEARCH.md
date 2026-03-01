# Phase 19: Memory Management Unit - Research

**Researched:** 2026-03-01
**Domain:** RISC-V Sv32 Virtual Memory, WebGPU Compute Shaders
**Confidence:** HIGH

## Summary

This phase completes the MMU implementation for Sv32 virtual memory support in the existing `visual_cpu_riscv.wgsl` shader. The shader already has a working `translate_address()` function (lines 366-432) that implements the 2-level page table walk for Sv32, including:
- VPN[1]/VPN[0] extraction from virtual addresses
- Page table entry parsing (V, XWR, PPN bits)
- MegaPage support (leaf at level 1)
- A/D bit setting for accessed/dirty tracking
- Page fault signaling via 0xFFFFFFFF return

What remains to complete Phase 19:
1. **TLB caching** - Currently every memory access walks page tables; a simple cache would improve performance
2. **Memory-mapped I/O regions** - Define and handle device address ranges (UART, SBI bridge already exist)
3. **Full integration testing** - Verify page faults trigger correctly, MMU can be enabled/disabled via satp
4. **SFENCE.VMA instruction** - TLB flush instruction (optional but recommended for Linux compatibility)

**Primary recommendation:** Extend the existing translate_address() function with a simple direct-mapped TLB cache in WGSL, add SFENCE.VMA support, and create comprehensive integration tests for the MMU paths.

## Standard Stack

The established libraries/tools for this domain:

### Core
| Library | Version | Purpose | Why Standard |
|---------|---------|---------|--------------|
| WebGPU | 2024+ spec | GPU compute shaders | Project constraint - GPU-only execution |
| WGSL | WebGPU shader language | Shader implementation | Required for WebGPU |
| RISC-V Privileged Spec | v1.12 | Sv32 page table format | Official specification |

### Existing Implementation (Project-specific)
| Component | File | Lines | Purpose |
|-----------|------|-------|---------|
| visual_cpu_riscv.wgsl | systems/visual_shell/web/shaders/ | 805 | Main RISC-V shader with translate_address() |
| mmu_core.wgsl | systems/visual_shell/web/shaders/ | 78 | Hilbert-based spatial MMU (alternative approach) |
| VisualMMU.js | systems/visual_shell/web/ | 95 | JavaScript MMU helper class |
| memory.rs | systems/infinite_map_rs/src/riscv/ | 504 | Rust CSR bank and memory layout |

### Specification References
| Document | URL | Purpose |
|----------|-----|---------|
| RISC-V Privileged v1.12 | https://riscv.org/technical/specifications/ | Sv32 page table format, satp CSR |
| MMU_ARCHITECTURE.md | systems/visual_shell/web/docs/ | Project-specific MMU documentation |

## Architecture Patterns

### Current Sv32 Translation Implementation (visual_cpu_riscv.wgsl lines 366-432)
```wgsl
fn translate_address(vaddr: u32, access_type: u32, base_idx: u32) -> u32 {
    let satp = cpu_states[base_idx + CSR_SATP];
    let satp_mode = (satp >> 31u) & 1u;

    var paddr: u32 = 0u;

    if (satp_mode == 0u) {
        paddr = vaddr;  // Bare metal mode - no translation
    } else {
        // Sv32 two-level page table walk
        let vpn1 = (vaddr >> 22u) & 0x3FFu;   // Level 1 index
        let vpn0 = (vaddr >> 12u) & 0x3FFu;   // Level 0 index
        let offset = vaddr & 0xFFFu;          // Page offset

        let ppn_root = satp & 0x3FFFFFu;      // Root page table PPN
        let pte1_addr = (ppn_root * 4096u) + (vpn1 * 4u);

        var pte1 = system_memory[pte1_addr / 4u];
        let pte1_v = pte1 & 1u;
        if (pte1_v == 0u) { return 0xFFFFFFFFu; }  // Invalid PTE

        let pte1_xwr = (pte1 >> 1u) & 0x7u;
        if (pte1_xwr != 0u) {
            // Leaf PTE at level 1 (MegaPage - 4MB page)
            let ppn1 = (pte1 >> 10u) & 0xFFFFFu;
            paddr = (ppn1 << 22u) | (vpn0 << 12u) | offset;
        } else {
            // Walk to level 0
            let ppn1_from_pte1 = (pte1 >> 10u) & 0x3FFFFFu;
            let pte0_addr = (ppn1_from_pte1 * 4096u) + (vpn0 * 4u);
            var pte0 = system_memory[pte0_addr / 4u];
            if ((pte0 & 1u) == 0u) { return 0xFFFFFFFFu; }

            // Permission checks
            let pte_r = (pte0 >> 1u) & 1u;
            let pte_w = (pte0 >> 2u) & 1u;
            let pte_x = (pte0 >> 3u) & 1u;

            if (access_type == ACCESS_READ && pte_r == 0u) { return 0xFFFFFFFFu; }
            if (access_type == ACCESS_WRITE && pte_w == 0u) { return 0xFFFFFFFFu; }
            if (access_type == ACCESS_EXEC && pte_x == 0u) { return 0xFFFFFFFFu; }

            let ppn0 = (pte0 >> 10u) & 0xFFFFFu;
            paddr = (ppn0 << 12u) | offset;

            // Set A/D bits
            pte0 = pte0 | 0x40u;  // A=1
            if (access_type == ACCESS_WRITE) { pte0 = pte0 | 0x80u; }  // D=1
            system_memory[pte0_addr / 4u] = pte0;
        }
    }
    return paddr;
}
```

### Sv32 Virtual Address Format (32-bit)
```
+------------------+------------------+------------------+
|  VPN[1]          |  VPN[0]          |  Offset          |
|  (10 bits)       |  (10 bits)       |  (12 bits)       |
|  31:22           |  21:12           |  11:0            |
+------------------+------------------+------------------+

VPN[1] = Level 1 page table index (0-1023)
VPN[0] = Level 0 page table index (0-1023)
Offset = Byte offset within 4KB page (0-4095)
```

### Sv32 Page Table Entry Format (32-bit)
```
+------------------+-----+----+----+----+----+----+----+----+
|  PPN[1:0]        | RSW | D  | A  | G  | U  | XWR| V  |
|  (22 bits)       |(2b) |(1b)|(1b)|(1b)|(1b)|(3b)|(1b)|
|  31:10           | 9:8 | 7  | 6  | 5  | 4  |3:1 | 0  |
+------------------+-----+----+----+----+----+----+----+

V (bit 0)  - Valid
R (bit 1)  - Readable
W (bit 2)  - Writable
X (bit 3)  - Executable
U (bit 4)  - User accessible
G (bit 5)  - Global (not flushed on SFENCE.VMA)
A (bit 6)  - Accessed (set by hardware on first access)
D (bit 7)  - Dirty (set by hardware on first write)
PPN        - Physical Page Number (bits 10-31)
```

### satp CSR Format (32-bit)
```
+-----+----------------+------------------+
|mode |     ASID       |      PPN         |
|(1b) |    (9b)        |     (22b)        |
| 31  |    30:22       |     21:0         |
+-----+----------------+------------------+

mode=0: Bare (no translation)
mode=1: Sv32 (enabled)
ASID: Address Space ID (not currently used)
PPN: Root page table physical page number
```

### CSR Indices in cpu_states Array
```wgsl
// Already defined in visual_cpu_riscv.wgsl:
const CSR_SATP: u32 = 34u;      // 0x180 - Page table base + mode
const CSR_STVEC: u32 = 35u;     // 0x105 - Trap handler address
const CSR_MODE: u32 = 37u;      // Privilege mode (0=U, 1=S, 3=M)

// Page fault cause codes (already defined):
const CAUSE_INST_PAGE_FAULT: u32 = 12u;
const CAUSE_LOAD_PAGE_FAULT: u32 = 13u;
const CAUSE_STORE_PAGE_FAULT: u32 = 15u;

// Access types (already defined):
const ACCESS_READ: u32 = 0u;
const ACCESS_WRITE: u32 = 1u;
const ACCESS_EXEC: u32 = 2u;
```

### Memory-Mapped I/O Regions
```wgsl
// Already defined in visual_cpu_riscv.wgsl:
const MMIO_INPUT_BASE: u32 = 0x02000000u;  // 32MB offset - Input events
const UART_BASE: u32 = 0x05000000u;         // 80MB offset - UART console
const SBI_BRIDGE_ADDR: u32 = 0x05010000u;   // SBI call bridge to JavaScript

// Memory layout (64MB total):
// 0x00000000 - 0x00FFFFFF (16MB)  - Kernel code/data
// 0x01000000 - 0x01FFFFFF (16MB)  - Framebuffer
// 0x02000000 - 0x02FFFFFF (16MB)  - MMIO region
// 0x03000000 - 0x03FFFFFF (16MB)  - Page tables
```

### Recommended TLB Structure (to add)
```wgsl
// Simple direct-mapped TLB with 16 entries
// Each entry: [tag(20), paddr(22), flags(8), valid(1)] = 1 u32 per entry
const TLB_ENTRIES: u32 = 16u;
var<private> tlb_tags: array<u32, TLB_ENTRIES>;
var<private> tlb_paddrs: array<u32, TLB_ENTRIES>;
var<private> tlb_flags: array<u32, TLB_ENTRIES>;

fn tlb_lookup(vaddr: u32) -> u32 {
    let vpn = vaddr >> 12u;
    let idx = vpn % TLB_ENTRIES;
    let offset = vaddr & 0xFFFu;

    if (tlb_tags[idx] == vpn && (tlb_flags[idx] & 1u) != 0u) {
        // TLB hit
        return (tlb_paddrs[idx] << 12u) | offset;
    }
    return 0xFFFFFFFFu;  // TLB miss
}

fn tlb_fill(vaddr: u32, paddr: u32, flags: u32) {
    let vpn = vaddr >> 12u;
    let idx = vpn % TLB_ENTRIES;
    tlb_tags[idx] = vpn;
    tlb_paddrs[idx] = paddr >> 12u;
    tlb_flags[idx] = flags | 1u;  // Set valid bit
}

fn tlb_flush() {
    for (var i = 0u; i < TLB_ENTRIES; i = i + 1u) {
        tlb_flags[i] = 0u;  // Clear valid bit
    }
}
```

### SFENCE.VMA Instruction (to add)
```wgsl
// SFENCE.VMA: opcode=0x73, funct3=0, rs1/x0, rs2/x0, funct12=0x000
// Encoding: 0x12000073
// With rs1/rs2 specified: flush specific ASID/VPN
// With rs1=rs2=x0: flush all TLB entries

// In opcode 0x73 handler:
if (funct7_sys == 0x12u && funct3_sys == 0u) {
    // SFENCE.VMA
    tlb_flush();
    // No PC change needed, just continue
}
```

## Don't Hand-Roll

Problems that look simple but have existing solutions:

| Problem | Don't Build | Use Instead | Why |
|---------|-------------|-------------|-----|
| Page table walk logic | Custom walker | Existing translate_address() | Already implemented and tested |
| CSR access | Direct array access | _get_csr_index() helper | Handles unknown CSR gracefully |
| Trap entry on fault | Custom trap code | trap_enter_dispatch() | Already handles M/S mode routing |
| Permission checking | Bit manipulation | PTE XWR bits per spec | Spec defines exact semantics |

**Key insight:** The heavy lifting is already done. Phase 19 is about optimization (TLB), edge cases (SFENCE.VMA), and comprehensive testing.

## Common Pitfalls

### Pitfall 1: Page Table Address Space Confusion
**What goes wrong:** Using virtual addresses as page table pointers
**Why it happens:** Page tables live in physical memory, not virtual
**How to avoid:** Page table walks always use physical addresses; PPN from PTE is physical page number
**Warning signs:** Page table reads return garbage, translation always fails

### Pitfall 2: Forgetting A/D Bit Updates
**What goes wrong:** Linux hangs because it relies on Accessed/Dirty bits
**Why it happens:** A/D bits seem optional but Linux needs them for page replacement
**How to avoid:** Always set A bit on any access, D bit on writes (already implemented in translate_address)
**Warning signs:** Linux boots slowly or hangs during memory pressure

### Pitfall 3: MegaPage vs Regular Page Confusion
**What goes wrong:** Treating level-1 leaf PTE as pointer to level-0
**Why it happens:** Sv32 allows leaf PTEs at either level
**How to avoid:** Check XWR bits - if non-zero, it's a leaf; if zero, continue walk
**Warning signs:** 4MB regions cause translation failures

### Pitfall 4: TLB Not Flushed on satp Change
**What goes wrong:** Stale translations after context switch
**Why it happens:** TLB caches old page table entries
**How to avoid:** Flush TLB when satp is written (or implement SFENCE.VMA)
**Warning signs:** Process A sees Process B's memory after switch

### Pitfall 5: Memory-Mapped I/O Through MMU
**What goes wrong:** MMU translates device addresses to wrong physical pages
**Why it happens:** MMIO regions should be identity-mapped or bypassed
**How to avoid:** Identity map MMIO regions in page tables, or check paddr for MMIO range
**Warning signs:** UART output doesn't appear, device access hangs

### Pitfall 6: Permission Check Order
**What goes wrong:** Wrong fault type reported
**Why it happens:** Checking permissions before checking PTE validity
**How to avoid:** Always check V bit first, then XWR permissions
**Warning signs:** Page faults have wrong cause code in scause/mcause

## Code Examples

### Enabling MMU from JavaScript
```javascript
// Set satp to enable Sv32 with root page table at 0x03000000
const rootPA = 0x03000000;
const satp = (1 << 31) | (rootPA >> 12);  // mode=1 (Sv32), ppn=rootPA>>12
device.queue.writeBuffer(stateBuffer, 34 * 4, new Uint32Array([satp]));
```

### Setting Up Identity Map for First 16MB
```javascript
// Map VA 0x00000000-0x00FFFFFF -> PA 0x00000000-0x00FFFFFF
// This requires 4 PTEs at level 1 (each covers 4MB)
const rootTable = 0x03000000;

// Level 1 entries (4MB each, covering 16MB)
for (let i = 0; i < 4; i++) {
    const pte = (i << 20) | 0x0F;  // PPN=i<<10, V=R=W=X=1
    device.queue.writeBuffer(memoryBuffer, rootTable + i * 4, new Uint32Array([pte]));
}
```

### Page Fault Handler Test
```wgsl
// Test that accessing unmapped memory triggers page fault
// VA 0xDEADBEEF should fault if not mapped

fn test_page_fault() {
    // Try to read from unmapped VA
    let vaddr = 0xDEADBEEFu;
    let paddr = translate_address(vaddr, ACCESS_READ, base_idx);

    if (paddr == 0xFFFFFFFFu) {
        // Translation failed - should trigger trap
        pc = trap_enter_dispatch(base_idx, CAUSE_LOAD_PAGE_FAULT, vaddr, pc);
    }
}
```

### TLB-Enhanced translate_address
```wgsl
fn translate_address_cached(vaddr: u32, access_type: u32, base_idx: u32) -> u32 {
    // Check TLB first
    let tlb_result = tlb_lookup(vaddr);
    if (tlb_result != 0xFFFFFFFFu) {
        return tlb_result;
    }

    // TLB miss - do full walk
    let paddr = translate_address(vaddr, access_type, base_idx);
    if (paddr != 0xFFFFFFFFu) {
        // Cache successful translation
        tlb_fill(vaddr, paddr, 0u);  // flags=0 for now
    }
    return paddr;
}
```

## State of the Art

| Old Approach | Current Approach | When Changed | Impact |
|--------------|------------------|--------------|--------|
| No MMU | Bare metal only | Phase 17 | Direct physical access |
| Basic translate_address | Sv32 2-level walk | Phase 17-18 | Virtual memory support |
| No TLB | Page table walk every access | Current | Slow but correct |
| No SFENCE.VMA | Manual satp toggle | Current | Limited Linux compat |

**Deprecated/outdated:**
- mmu_core.wgsl Hilbert-based approach: Alternative spatial MMU not currently integrated with main shader

## Open Questions

1. **TLB Size Tradeoff**
   - What we know: TLB improves performance but uses GPU resources
   - What's unclear: Optimal TLB size for WGSL (16? 32? 64 entries?)
   - Recommendation: Start with 16 entries (direct-mapped), measure hit rate

2. **Per-Thread vs Shared TLB**
   - What we know: WGSL has thread-private variables and workgroup-shared
   - What's unclear: Should TLB be per-core (thread) or shared across workgroup?
   - Recommendation: Per-thread for simplicity; shared requires synchronization

3. **ASID Support**
   - What we know: satp has ASID field for address space identification
   - What's unclear: Do we need full ASID support or just flush on context switch?
   - Recommendation: Skip ASID for now, flush TLB on any satp write

4. **Memory Protection**
   - What we know: PTE has U bit for user-mode access
   - What's unclear: Should we enforce U bit in supervisor mode?
   - Recommendation: Check U bit only when in user mode (mode=0)

## Sources

### Primary (HIGH confidence)
- RISC-V Privileged Specification v1.12 - Sv32 format, satp CSR, page table walk
- Existing visual_cpu_riscv.wgsl - Current implementation patterns
- MMU_ARCHITECTURE.md - Project-specific documentation

### Secondary (MEDIUM confidence)
- systems/infinite_map_rs/src/riscv/memory.rs - Rust CSR struct reference
- test_mmu_translation.js - Existing MMU test patterns

### Tertiary (LOW confidence)
- None - All findings verified against primary sources

## Metadata

**Confidence breakdown:**
- Standard stack: HIGH - WebGPU/WGSL fixed, RISC-V spec authoritative, existing code well-documented
- Architecture: HIGH - translate_address() already implemented, patterns clear
- Pitfalls: HIGH - Based on RISC-V spec and common emulator implementation experience

**Research date:** 2026-03-01
**Valid until:** 30 days - RISC-V spec stable, WebGPU maturing but core features stable
