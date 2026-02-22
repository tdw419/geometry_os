# PixelRTS Boot Improvement

## What This Is

A transformation of PixelRTS from a novel encoding format into a practical, production-ready OS boot and distribution system. The project improves the existing PixelRTS v2 implementation (PNG-based OS containers with Hilbert curve encoding) to demonstrate real advantages over traditional ISO-based booting.

## Core Value

**Booting an OS should be as visual and intuitive as opening an image file.**

If everything else fails, users must be able to:
1. Drag an `.rts.png` file to boot
2. See what OS they're about to boot (visual preview)
3. Trust the container (vision-based verification)

## Requirements

### Validated

✓ **PixelRTS v2 encoding/decoding** — existing
  - `systems/pixel_compiler/pixelrts_v2_core.py` - PNG ↔ binary conversion
  - Hilbert curve spatial mapping
  - Metadata in PNG tEXt chunks

✓ **Kernel/initrd extraction** — existing
  - `systems/pixel_compiler/pixelrts_v2_extractor.py` - CLI extraction tool
  - JSON/RTS format parsing
  - SHA256 hash verification

✓ **Basic QEMU boot** — existing
  - Direct kernel boot with `-kernel`/`-initrd`
  - Serial console output
  - Disk image support (qcow2)

### Active

- [ ] **VISION-01**: Vision model can identify kernel version, OS distro, and architecture from PNG visual patterns
- [ ] **VISION-02**: Vision model can detect tampering or corruption in OS containers
- [ ] **DIRECT-01**: Boot .rts.png files without manual extraction (one-command boot)
- [ ] **DIRECT-02**: FUSE filesystem presents PNG as kernel/initrd for boot
- [ ] **INSTALL-01**: Install OS from .rts.png to disk with visual progress feedback
- [ ] **CATALOG-01**: Visual manager displaying OS containers as thumbnails
- [ ] **CATALOG-02**: One-click boot from visual catalog
- [ ] **NETWORK-01**: Boot PixelRTS containers over network (PXE/NBD)
- [ ] **NETWORK-02**: Delta-based OS updates (download only changed bytes)

### Out of Scope

- **Cloud provider integration** — Focus on local/boot scenarios first
- **Mobile apps** — Web/desktop interface only for v1
- **Container formats beyond PNG** — PixelRTS v2 is fixed
- **Non-x86 architectures** — x86_64 only for v1 (RISC-V can come later)
- **Full OS installation from scratch** — Building on existing Alpine/Ubuntu bases

## Context

**Existing Codebase:**
- Geometry OS is a large project with PixelRTS v2 as a component
- Primary languages: Python 3.12+, TypeScript/JavaScript, Rust, WGSL
- Located in `systems/pixel_compiler/` for PixelRTS components
- Uses QEMU for virtualization testing

**Current State:**
- PixelRTS v2 encoding/decoding works
- Can extract kernel/initrd from PNG containers
- Can boot extracted binaries with QEMU
- BUT: No advantage over ISO booting today (extraction adds complexity)

**The Problem We're Solving:**
PixelRTS is technically impressive but practically useless. We need to deliver on the promise:
- Vision-based OS analysis (the unique advantage)
- Direct PNG boot (remove extraction friction)
- Visual OS management (spatial software catalog)
- Full ecosystem (install, update, multi-boot)

**Key Files:**
- `systems/pixel_compiler/pixelrts_v2_core.py` - Core encoding/decoding
- `systems/pixel_compiler/pixelrts_v2_extractor.py` - CLI extraction
- `systems/pixel_compiler/pixelrts_vision_analyzer.py` - Vision analysis foundation
- `alpine.rts.png` - Example Alpine Linux container
- `kernel`, `initrd` - Extracted boot binaries

## Constraints

- **Python 3.12+** - Primary implementation language
- **QEMU** - Virtualization platform for testing
- **Existing PixelRTS v2 format** - Must maintain backward compatibility
- **Vision model access** - Need Claude/VLM API for image analysis
- **Performance** - Boot overhead <10% vs traditional ISO boot

## Key Decisions

| Decision | Rationale | Outcome |
|----------|-----------|---------|
| Use existing PixelRTS v2 format | Leverage invested work, maintain compatibility | ✓ Good |
| FUSE filesystem for direct boot | Clean integration with existing tools | — Pending |
| Vision model for verification | Unique advantage of visual format | — Pending |
| Phase 1: Vision analysis | Demonstrates the core differentiator first | — Pending |

---
*Last updated: 2026-02-11 after initialization*
