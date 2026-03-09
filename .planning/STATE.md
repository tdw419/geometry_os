# Project State

## Project Reference

See: .planning/PROJECT.md (updated 2026-03-08)

**Core value:** Booting an OS should be as visual and intuitive as opening an image file.
**Current focus:** v1.2 Network Boot - Gap Closure

## Current Position

Phase: 8.1 of 8.1 (Wire Delta HTTP Handler) - COMPLETE
Plan: 1 of 1 (Wire DeltaHTTPHandler to HTTPBootServer)
Status: Gap Closure Complete
Last activity: 2026-03-09 — Completed 08.1-01 wire-delta-http-handler

Progress: [████████████████████] 100% (12/12 plans in v1.2)

## Performance Metrics

**v1.2 Velocity:**
- Plans completed: 12 (3 + 3 + 3 + 2 + 1 for Phase 8.1 gap closure)
- Duration: ~80 min total
- Tests: 425 passing (28 + 59 + 53 + 44 + 58 + 29 + 28 + 24 + 17 + 28 + 24 + 33)

**Cumulative:**
- v1.0: 22 plans
- v1.1: 4 plans
- v1.2: 12 plans
- Total: 38 plans

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

**07-02 Decisions:**
- Use raw asyncio instead of aiohttp for consistency with TFTPServer
- Support both GET and HEAD requests
- Parse multiple ranges but use first range for simplicity
- Accept-Ranges: bytes header to advertise range support

**07-03 Decisions:**
- Opt-in HTTP boot via --http flag (backward compatible)
- Graceful degradation if HTTP fails (continue TFTP-only)
- Service order: TFTP -> DHCP -> HTTP -> NBD
- Unified boot directory (HTTP serves from tftp_root)

**08-01 Decisions:**
- Gap merging threshold: 64 bytes to balance region count vs. download efficiency
- Include both old_checksum and new_checksum per region for client validation
- Default to stdout for piping, -o flag for file output

**08-02 Decisions:**
- Decode/encode cycle for .rts.png files (checksums match manifest's decoded data)
- ByteFetcher protocol for remote region fetching (Plan 03)
- Atomic in-place patching via temp file + rename
- Checksum validation on by default, --skip-validation available

**08-03 Decisions:**
- HTTP required for delta server (--delta without --http logs warning)
- Atomic manifest generation before server startup
- Bytes transferred tracking in HTTPByteFetcher
- Stem-based manifest naming ({container_stem}.json)

**08.1-01 Decisions:**
- Handler interface uses handle(path, headers, writer) -> bool pattern
- Custom handlers checked before static file serving for override capability
- DeltaHTTPHandler registered at /delta/ prefix

### Pending Todos

None.

### Blockers/Concerns

**Research Flags (from SUMMARY.md):**
- Phase 6: UEFI vs BIOS PXE differences - test on real hardware
- Phase 6: Memory-mapped Hilbert LUT may need performance profiling
- Phase 6: Port 69 (TFTP) requires root privileges or CAP_NET_BIND_SERVICE

## Session Continuity

Last session: 2026-03-09T02:31:12Z
Stopped at: Completed 08.1-01 wire-delta-http-handler
Resume file: None

**CLI Commands Available (v1.0 + v1.1 + v1.2):**
- `pixelrts analyze <file.png>` - Vision analysis and verification
- `pixelrts boot <file.png>` - Boot .rts.png files with QEMU
- `pixelrts install <file.png> <target>` - Install .rts.png to disk image
- `pixelrts catalog` - Launch visual catalog server
- `pixelrts diff <old.png> <new.png>` - Visual diff comparison
- `pixelrts delta <old.png> <new.png>` - Generate delta manifest
  - `-o/--output` - Output manifest file (default: stdout)
  - `-q/--quiet` - Suppress summary output
- `pixelrts patch <base.png> <manifest.json>` - Apply delta manifest
  - `-o/--output` - Output file (default: in-place)
  - `--skip-validation` - Skip checksum validation
  - `-q/--quiet` - Suppress success output
- `pixelrts update <file.png> --server <url>` - Update via delta from server
  - `--force` - Force update despite checksum mismatch
  - `--skip-validation` - Skip checksum validation
- `pixelrts serve <file.png>` - Start network boot services
  - `--http` - Enable HTTP boot for faster transfers
  - `--http-port PORT` - Custom HTTP port (default: 8080)
  - `--delta` - Enable delta manifest serving
  - `--delta-from <old.png>` - Generate initial delta from old version
