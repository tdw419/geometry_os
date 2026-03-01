# Project State

## Project Reference

See: .planning/PROJECT.md (updated 2026-02-28)

**Core value:** Booting an OS should be as visual and intuitive as opening an image file - from anywhere, including bare metal.
**Current focus:** Defining v1.4 requirements

## Current Position

**Milestone:** v1.4 GPU Linux Execution
**Phase:** Not started (defining requirements)
**Plan:** Not started
**Status:** Gathering requirements
**Last activity:** 2026-02-28 — Milestone v1.4 started

Progress: [----------] 0% (v1.4 requirements phase)

## Performance Metrics

**Velocity:**
- Total plans completed: 80 (v1.0: 23, v1.1: 8, v1.2: 14, v1.3: 20, other: 15)

**By Milestone:**

| Milestone | Phases | Plans | Status |
|-----------|--------|-------|--------|
| v1.0 | 1-4 | 23 | Complete |
| v1.1 | 5-6 | 8 | Complete |
| v1.2 | 7-11 | 14 | Complete |
| v1.3 | 12-16 | 20 | Complete |
| v1.4 | TBD | - | Requirements |

## Accumulated Context

### Shipped Milestones
- **v1.0:** PixelRTS Boot Improvement - Vision analysis, FUSE boot, installer, catalog
- **v1.1:** Visual Shell Integration - Desktop objects, boot progress, error handling
- **v1.2:** Network Boot - Cache infrastructure, remote client, remote boot, search, retry logic
- **v1.3:** PXE Boot - DHCP server, TFTP server, HTTP container serving, boot menu, visual shell integration (226 tests)

### Key Decisions (v1.3)
- iPXE bootloader for PXE (supports both BIOS and UEFI via chainload)
- asyncio.DatagramProtocol for DHCP UDP handling
- Round-robin IP allocation with lease reuse
- argparse subcommands for CLI structure (pxe dhcp start/stop/status)
- Pre-configure socket with SO_REUSEADDR/SO_BROADCAST before binding
- TFTP block size 512 bytes (RFC 1350 standard)
- Path traversal prevention via basename-only sanitization
- aiofiles for async file I/O enabling concurrent TFTP transfers
- aiohttp.web for async HTTP server (Application/Runner/TCPSite pattern)
- HTTP range requests (RFC 7233) for large container file support
- iPXE menu uses choose command with optional timeout for auto-boot
- PXE badge orange (#ff6600) for enabled, gray (#666666) for disabled
- Event-driven PXE toggle with pxe-toggled event for UI sync

### Blockers
- None currently

## Session Continuity

Last session: 2026-02-28T20:00:00Z
Status: v1.4 started, gathering requirements
Resume file: None

**Next Action:** Complete research, then define requirements
