---
spec: spatial-mmu
phase: requirements
created: 2026-02-25T20:10:00Z
generated: auto
---

# Requirements: spatial-mmu

## Summary

Harden the Spatial MMU with 64-register state, Morton-order texture mapping, guest region bounds checking, and instruction fetch protection for secure RISC-V execution on GPU.

## User Stories

### US-1: Secure Guest Isolation

As a hypervisor operator, I want guests restricted to their allocated texture regions so that malicious code cannot corrupt other guests.

**Acceptance Criteria**:
- AC-1.1: GUEST_BASE and GUEST_SIZE registers constrain all memory access
- AC-1.2: Out-of-bounds access returns 0xFFFFFFFF (page fault)
- AC-1.3: Bounds check applies in both bare mode and Sv32 mode

### US-2: Instruction Fetch Protection

As a security engineer, I want instruction fetch to go through MMU translation so that code execution respects memory permissions.

**Acceptance Criteria**:
- AC-2.1: PC (program counter) is treated as virtual address
- AC-2.2: Fetch uses ACCESS_EXEC permission check
- AC-2.3: Execute permission (X bit) enforced on instruction pages

### US-3: Texture Cache Locality

As a performance engineer, I want Morton-order address mapping so that sequential memory accesses hit nearby texture pixels.

**Acceptance Criteria**:
- AC-3.1: phys_to_morton() function converts linear to Z-curve
- AC-3.2: Sequential addresses map to spatially adjacent coordinates
- AC-3.3: Function available for future texture cache integration

### US-4: Transmutation Triggers

As a JIT engineer, I want dirty/access bit tracking so that tiered transmutation can invalidate caches.

**Acceptance Criteria**:
- AC-4.1: A bit (0x40) set on first read access
- AC-4.2: D bit (0x80) set on first write access
- AC-4.3: Write to executable page signals cache invalidation need

### US-5: Tectonic Register Access

As a hypervisor developer, I want JavaScript accessors for Tectonic registers so that I can configure guest regions programmatically.

**Acceptance Criteria**:
- AC-5.1: setGuestBase(kernelId, base) method exists
- AC-5.2: setGuestSize(kernelId, size) method exists
- AC-5.3: getTransmutationFlags(kernelId) async method exists

## Functional Requirements

| ID | Requirement | Priority | Source |
|----|-------------|----------|--------|
| FR-1 | 64-register state buffer with power-of-2 alignment | Must | Plan |
| FR-2 | GUEST_BASE at CSR index 46 | Must | Plan |
| FR-3 | GUEST_SIZE at CSR index 47 | Must | Plan |
| FR-4 | GEOM_CACHE_BASE at CSR index 48 | Must | Plan |
| FR-5 | TRANS_FLAGS at CSR index 49 | Must | Plan |
| FR-6 | Morton encoding functions (part1by1, morton_encode, morton_decode) | Must | Plan |
| FR-7 | Guest bounds checking in translate_address | Must | Plan |
| FR-8 | Instruction fetch through MMU translation | Must | Security |
| FR-9 | A/D bit setting on memory access | Must | Plan |
| FR-10 | D bit triggers cache invalidation signal | Should | Plan |
| FR-11 | JavaScript accessor methods for Tectonic registers | Must | Plan |

## Non-Functional Requirements

| ID | Requirement | Category |
|----|-------------|----------|
| NFR-1 | Shader compilation time < 500ms | Performance |
| NFR-2 | MMU translation overhead < 10 GPU cycles per access | Performance |
| NFR-3 | No security regressions in existing functionality | Security |
| NFR-4 | Backward compatible with bare mode (satp_mode=0) | Compatibility |

## Out of Scope

- Full texture cache implementation (future phase)
- QEMU emulation bridge (Phase 2)
- Neural transpiler (Phase 3)
- Tiered JIT with hot code detection (Phase 4)

## Dependencies

- WebGPU API (Chrome 113+, Edge 113+, Safari 17+)
- Existing `visual_cpu_riscv.wgsl` shader
- `GPUExecutionSystem` class in `gpu_execution_system.js`
