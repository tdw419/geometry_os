---
spec: spatial-mmu
phase: research
created: 2026-02-25T20:10:00Z
generated: auto
---

# Research: spatial-mmu

## Executive Summary

Harden the Spatial MMU in `visual_cpu_riscv.wgsl` by adding 64-register state buffer, Morton-order texture mapping, guest region bounds checking, and dirty/access bit tracking. Critical security gap: instruction fetch bypasses MMU translation. Implementation directly modifies existing working shader.

## Codebase Analysis

### Existing Patterns

- **visual_cpu_riscv.wgsl**: Full Sv32 page table walker with trap handling (lines 230-297)
- **64-register state**: Already expanded to 64 regs (line 19), Tectonic CSRs at 46-49
- **translate_address()**: Sv32 walker with A/D bits, permission checks
- **phys_to_morton()**: Morton encoding exists (lines 213-228)
- **check_guest_bounds**: Integrated in translate_address (lines 289-294)
- **GPUExecutionSystem**: JS class with RISCV_GUEST_BASE_INDEX at 46

### Dependencies

- WebGPU browser (Chrome 113+, Edge 113+)
- `gpu_execution_system.js` - state buffer management
- `test_tectonic_mmu.html` - existing test harness

### Constraints

- WGSL compute shader - no external libraries
- Must maintain backward compatibility with bare mode (satp_mode=0)
- Security: Instruction fetch currently uses PC directly without translation

## Gap Analysis

| Feature | Status | Action |
|---------|--------|--------|
| 64-register state | DONE | Verify constants |
| Morton encoding | DONE | Verify in shader |
| Guest bounds check | DONE | Verify in translate_address |
| Instruction fetch MMU | MISSING | Add translate for fetch |
| Dirty/access bits | PARTIAL | Verify in LOAD/STORE |
| Test page | EXISTS | Extend coverage |

## Feasibility Assessment

| Aspect | Assessment | Notes |
|--------|------------|-------|
| Technical Viability | High | Most code exists, need to verify and harden |
| Effort Estimate | S | Small - verification + one security fix |
| Risk Level | Low | Well-defined scope, existing patterns |

## Critical Security Gap

**Instruction Fetch Bypass**: Line 360 in visual_cpu_riscv.wgsl:
```wgsl
let inst = expanded_code[pc];  // pc is virtual, no translation!
```

This should go through `translate_address(pc, ACCESS_EXEC, base_idx)`.

## Recommendations

1. Verify existing MMU code matches plan specification
2. Add MMU translation to instruction fetch (security critical)
3. Extend test coverage for instruction fetch protection
4. Document Tectonic CSR usage in MMU_ARCHITECTURE.md
