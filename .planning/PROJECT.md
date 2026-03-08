# PixelRTS Boot Improvement

## What This Is

A production-ready OS boot and distribution system using PixelRTS PNG containers. Users can analyze, boot, install, and visually manage OS containers through CLI and web interfaces.

## Core Value

**Booting an OS should be as visual and intuitive as opening an image file.**

If everything else fails, users must be able to:
1. Drag an `.rts.png` file to boot
2. See what OS they're about to boot (visual preview)
3. Trust the container (vision-based verification)

## Requirements

### Validated

✓ **PixelRTS v2 encoding/decoding** — v1.0
  - `systems/pixel_compiler/pixelrts_v2_core.py` - PNG ↔ binary conversion
  - Hilbert curve spatial mapping
  - Metadata in PNG tEXt chunks

✓ **Kernel/initrd extraction** — v1.0
  - `systems/pixel_compiler/pixelrts_v2_extractor.py` - CLI extraction tool
  - JSON/RTS format parsing
  - SHA256 hash verification

✓ **Basic QEMU boot** — v1.0
  - Direct kernel boot with `-kernel`/`-initrd`
  - Serial console output
  - Disk image support (qcow2)

✓ **VISION-01**: Vision model identifies OS containers — v1.0
  - `pixelrts analyze <file.png>` command
  - OCR-based verification loop

✓ **DIRECT-01**: Boot .rts.png without extraction — v1.0
  - `pixelrts boot <file.png>` command
  - FUSE mount with automatic cleanup

✓ **DIRECT-02**: FUSE filesystem presents PNG as kernel/initrd — v1.0
  - `systems/pixel_compiler/boot/mount_helper.py`
  - `systems/pixel_compiler/boot/boot_bridge.py`

✓ **INSTALL-01**: Install OS to disk with visual progress — v1.0
  - `pixelrts install <file.png> <target>` command
  - InstallProgress with TTY-aware output

✓ **CATALOG-01**: Visual manager with thumbnails — v1.0
  - `pixelrts catalog` command
  - CatalogScanner, ThumbnailCache, CatalogServer

✓ **CATALOG-02**: One-click boot from catalog — v1.0
  - HTML gallery with boot buttons
  - SpatialLayoutManager for drag-and-drop

### Active

- [ ] **VISION-02**: Vision model can detect tampering or corruption
- [ ] **NETWORK-01**: Boot PixelRTS containers over network (PXE/NBD)
- [ ] **NETWORK-02**: Delta-based OS updates (download only changed bytes)

### Out of Scope

- **Cloud provider integration** — Focus on local/boot scenarios first
- **Mobile apps** — Web/desktop interface only
- **Container formats beyond PNG** — PixelRTS v2 is fixed
- **Non-x86 architectures** — x86_64 only (RISC-V later)
- **Full OS installation from scratch** — Building on existing Alpine/Ubuntu bases

## Context

**Shipped v1.0 (2026-03-08):**
- 4 phases, 22 plans completed
- CLI commands: analyze, boot, install, catalog
- 90+ unit tests across boot, install, catalog

**Tech Stack:**
- Python 3.12+
- QEMU virtualization
- FUSE (fuse3, fusepy)
- FastAPI for catalog server
- Rich for terminal output
- PIL for image processing

**Key Files:**
- `systems/pixel_compiler/boot/` - Boot infrastructure (MountHelper, BootBridge, BootProgress)
- `systems/pixel_compiler/install/` - Install infrastructure (InstallProgress, DiskWriter, InstallEngine)
- `systems/pixel_compiler/catalog/` - Catalog infrastructure (CatalogScanner, ThumbnailCache, CatalogServer)
- `bin/pixelrts` - CLI entry point

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
| FUSE filesystem for direct boot | Clean integration with existing tools | ✓ Good |
| Vision model for verification | Unique advantage of visual format | ✓ Good |
| Phase 1: Vision analysis first | Demonstrates core differentiator | ✓ Good |
| MountHelper context manager pattern | RAII-style cleanup | ✓ Good |
| Lazy unmount with fusermount -uz | Stuck mount recovery | ✓ Good |
| Rich library for terminal output | Graceful fallback to plain text | ✓ Good |
| MD5 hash of path for catalog IDs | Stable, collision-resistant | ✓ Good |

---
*Last updated: 2026-03-08 after v1.0 milestone*
