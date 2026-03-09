# Project State

## Project Reference

See: .planning/PROJECT.md (updated 2026-03-08)

**Core value:** Booting an OS should be as visual and intuitive as opening an image file.
**Current focus:** Phase 7 - HTTP Boot via iPXE

## Current Position

Phase: 7 of 8 (HTTP Boot via iPXE)
Plan: 01 of 3 (iPXE Chainload Configuration)
Status: In progress
Last activity: 2026-03-09 — Completed 07-01-PLAN.md

Progress: [███████░░░░░░░░░░░░░] 38% (4/8 plans in v1.2)

## Performance Metrics

**v1.2 Velocity:**
- Plans completed: 4
- Duration: ~30 min (13 + 9 + 8)
- Tests: 184 passing (28 + 59 + 53 + 44)

**Cumulative:**
- v1.0: 22 plans
- v1.1: 4 plans
- v1.2: 4 plans (Phase 7 in progress)
- Total: 30 plans

## Accumulated Context

### Decisions

Key decisions archived in `.planning/milestones/`:
- v1.0: FUSE boot, Rich output, vision analysis
- v1.1: scipy regions, RGBA channel mapping, diff command

**v1.2 Roadmap Decisions:**
- Phase 6: Combine NBD + PXE into single phase (8 requirements)
- Phase 7: HTTP boot as enhancement layer (2 requirements)
- Phase 8: Delta updates leverage existing PixelRTSDiffer (3 requirements)

**06-01 Decisions:**
- Range decoding in decoder class (decode_range()) for reusability
- Mock nbdkit module for testing without nbdkit installed

**06-02 Decisions:**
- Proxy DHCP mode (port 4011) to avoid conflicting with existing DHCP servers
- Asyncio design for integration with serve command event loop
- Read-only TFTP server (RRQ only) for security

**06-03 Decisions:**
- Async orchestrator pattern for service coordination
- Signal handlers for graceful Ctrl+C shutdown
- Rich library optional with graceful degradation
- Exit codes: 1=invalid file, 2=port in use, 3=network failed, 4=service failed

**07-01 Decisions:**
- Use urllib.request for undionly.kpxe download (no new dependencies)
- Best-effort download with user fallback if CDN fails
- Class constants for IPXE_BOOT_FILE and IPXE_DOWNLOAD_URL

### Pending Todos

None.

### Blockers/Concerns

**Research Flags (from SUMMARY.md):**
- Phase 6: UEFI vs BIOS PXE differences - test on real hardware
- Phase 6: Memory-mapped Hilbert LUT may need performance profiling
- Phase 6: Port 69 (TFTP) requires root privileges or CAP_NET_BIND_SERVICE

## Session Continuity

Last session: 2026-03-09T00:20:45Z
Stopped at: Completed 07-01-PLAN.md (iPXE Chainload Configuration)
Resume file: None

**CLI Commands Available (v1.0 + v1.1 + v1.2):**
- `pixelrts analyze <file.png>` - Vision analysis and verification
- `pixelrts boot <file.png>` - Boot .rts.png files with QEMU
- `pixelrts install <file.png> <target>` - Install .rts.png to disk image
- `pixelrts catalog` - Launch visual catalog server
- `pixelrts diff <old.png> <new.png>` - Visual diff comparison
- `pixelrts serve <file.png>` - Start network boot services (NEW in v1.2)

**Planned Commands (v1.2):**
- `pixelrts delta <old.png> <new.png>` - Generate delta manifest (Phase 8)
