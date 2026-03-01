# Project State

## Project Reference

See: .planning/PROJECT.md (updated 2026-02-28)

**Core value:** Booting an OS should be as visual and intuitive as opening an image file - from anywhere.
**Current focus:** Phase 19 Planning Complete - Ready for Execution

## Current Position

Phase: 19 of 22 (Memory Management Unit)
Plan: 3 of 4 complete
Status: In Progress
Last activity: 2026-03-01 - Completed 19-03 MMU Test Suite

Progress: [6/6 phases complete: ██████]

## Performance Metrics

**Velocity:**
- Total plans completed: 88 (v1.0: 23, v1.1: 8, v1.2: 14, v1.3: 20, v1.4: 8, other: 15)
- v1.4 plans completed: 8

**By Milestone:**

| Milestone | Phases | Plans | Status |
|-----------|--------|-------|--------|
| v1.0 | 1-4 | 23 | Complete |
| v1.1 | 5-6 | 8 | Complete |
| v1.2 | 7-11 | 14 | Complete |
| v1.3 | 12-16 | 20 | Complete |
| v1.4 | 17-22 | 7 | In Progress |

## Accumulated Context

### Shipped Milestones
- **v1.0:** PixelRTS Boot Improvement - Vision analysis, FUSE boot, installer, catalog
- **v1.1:** Visual Shell Integration - Desktop objects, boot progress, error handling
- **v1.2:** Network Boot - Cache infrastructure, remote client, remote boot, search, retry logic
- **v1.3:** PXE Boot - DHCP server, TFTP server, HTTP container serving, boot menu, visual shell integration (226 tests)

### Key Decisions (v1.4)
- WebGPU compute shaders for RISC-V emulation (no CPU fallback)
- RV32I base instruction set target (not RV64)
- 64MB+ GPU storage buffer for kernel memory
- Phase ordering: Core -> Privileged -> MMU -> Devices -> Boot -> UI
- Staging buffer pattern for GPU readback (await mapAsync, destroy buffer)
- Funct3 dispatch for instruction variants within opcodes
- Read-modify-write for byte/halfword memory operations
- Signed vs unsigned comparison patterns (val1 vs uval1)
- JavaScript port of Rust RiscvTestEncoder pattern for testing
- M-mode CSRs at indices 50-59 (sequential after Tectonic extensions at 46-49)
- SbiBridge for GPU-to-JS communication using staging buffer pattern
- Boot starts in M-mode (mode=3) per RISC-V privileged spec
- Trap delegation via medeleg/mideleg CSR bit checking
- PrivilegedTestEncoder provides both static and instance methods for flexibility
- SbiBridge polling after GPU dispatch for console output
- Color-coded privilege mode badges: Orange (M), Blue (S), Gray (U)
- TLB caching with 16-entry direct-mapped cache (per-thread private storage)
- SFENCE.VMA instruction for TLB flush (Linux compatibility)
- TLB flushed on satp write for simplicity (no ASID support)
- SFENCE.VMA full flush (no ASID/VPN filtering for simple implementation)
- CSR number captured for post-write actions (e.g., TLB flush on satp)
- MMU test suite with 7 tests covering bare mode, identity map, page faults, TLB, MMIO
- MegaPage identity mapping pattern for MMU testing (4MB entries, V+R+W+X=0x0F)

### Blockers
- None currently

### v1.4 Research Flags
- Phase 20: GPU-JS async coordination patterns
- Phase 21: Alpine RV32 kernel build process

## Session Continuity

Last session: 2026-03-01T12:45:30Z
Status: Phase 19 plan 19-03 complete (MMU Test Suite)
Resume file: None

**Next Action:** Run `/gsd:execute-plan 19-04` to complete MMU phase
