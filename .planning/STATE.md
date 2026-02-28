# Project State

## Project Reference

See: .planning/PROJECT.md (updated 2026-02-28)

**Core value:** Booting an OS should be as visual and intuitive as opening an image file - from anywhere, including bare metal.
**Current focus:** v1.3 PXE Boot - Phase 14 HTTP Server complete

## Current Position

**Milestone:** v1.3 PXE Boot
**Phase:** 15 - Boot Menu
**Plan:** Not started
**Status:** Ready to plan
**Last activity:** 2026-02-28 - Phase 14 HTTP Container Serving verified complete

Progress: [█████] 80% (4/5 phases complete, 14/16 plans in v1.3)

## Performance Metrics

**Velocity:**
- Total plans completed: 73 (v1.0: 23, v1.1: 8, v1.2: 14, v1.3: 14, other: 14)
- Current milestone: 14

**By Milestone:**

| Milestone | Phases | Plans | Status |
|-----------|--------|-------|--------|
| v1.0 | 1-4 | 23 | Complete |
| v1.1 | 5-6 | 8 | Complete |
| v1.2 | 7-11 | 14 | Complete |
| v1.3 | 12-16 | 7 | In Progress |

**v1.3 Breakdown:**

| Phase | Goal | Requirements | Status |
|-------|------|--------------|--------|
| 12 - DHCP Server | PXE clients receive boot instructions | 4 | **Complete** (4/4 plans) |
| 13 - TFTP Server | Bootloader delivered via TFTP | 4 | **Complete** (4/4 plans) |
| 14 - HTTP Serving | Containers available via HTTP | 4 | **Complete** (4/4 plans) |
| 15 - Boot Menu | Interactive container selection | 4 | Pending |
| 16 - Integration | Unified with v1.2 infrastructure | 4 | Pending |

## Accumulated Context

### Shipped Milestones
- **v1.0:** PixelRTS Boot Improvement - Vision analysis, FUSE boot, installer, catalog
- **v1.1:** Visual Shell Integration - Desktop objects, boot progress, error handling
- **v1.2:** Network Boot - Cache infrastructure, remote client, remote boot, source filtering, search, retry logic, cache management UI
- **v1.3 (partial):** DHCP Server - Async DHCP with PXE options, CLI interface, comprehensive tests, integration testing, production logging
- **v1.3 (partial):** TFTP Server - Async TFTP with RFC 1350 packet handling, path traversal protection, concurrent transfers, CLI interface, comprehensive tests (52 tests)
- **v1.3 (partial):** HTTP Server - Async HTTP with aiohttp, range requests (HTTP 206), path traversal protection, CLI interface, catalog integration, comprehensive tests (66 tests)

### Key Decisions
- PixiJS v7 for desktop rendering
- REST polling for boot status (1000ms interval, max 60 attempts)
- Position mapping: server `position.{x,y}` -> client `layout.{gridX,gridY}`
- 30-second boot timeout with 4-stage progress animation
- ERROR_GUIDANCE pattern matching for actionable error suggestions
- Native IndexedDB for container caching (no external library)
- Native Web Crypto API for SHA256 hash computation
- Stale-while-revalidate pattern for responsive UI
- Streaming download via fetch ReadableStream
- MAX_RETRIES=3 with exponential backoff (1s, 2s, 4s max)
- iPXE bootloader for PXE (supports both BIOS and UEFI via chainload)
- asyncio.DatagramProtocol for DHCP UDP handling
- Round-robin IP allocation with lease reuse
- argparse subcommands for CLI structure (pxe dhcp start/stop/status)
- Pre-configure socket with SO_REUSEADDR/SO_BROADCAST before binding
- Periodic status logging via asyncio background task (5 min interval)
- Verbose debug logging for raw packet inspection
- TFTP block size 512 bytes (RFC 1350 standard)
- Path traversal prevention via basename-only sanitization
- aiofiles for async file I/O enabling concurrent TFTP transfers
- asyncio.Event for ACK signaling between sync/async contexts
- asyncio.ensure_future for spawning concurrent transfer tasks
- TFTP CLI subcommands following DHCP pattern (pxe tftp start/stop)
- unittest with MagicMock for protocol testing
- Helper functions for TFTP test packet building
- aiohttp.web for async HTTP server (Application/Runner/TCPSite pattern)
- HTTP range requests (RFC 7233) for large container file support
- HTTP CLI subcommands following DHCP/TFTP pattern (pxe http start/stop)
- --watch-path CLI option uses action='append' for multiple directories
- Catalog integration with optional watch_paths configuration
- PXEContainerInfo for tracking per-container PXE availability with boot order
- Graceful fallback to file-based serving when CatalogScanner unavailable
- unittest with aiohttp TestClient for async HTTP testing
- Dynamic port allocation (28080+) to avoid test port conflicts

### Components Shipped
- RTSDesktopObject.js (2030 lines) - PIXI.Container with all UI features
- CatalogBridge.js (486 lines) - API client with cache-first fetching
- DesktopObjectManager.js (1569 lines) - Lifecycle manager with remote integration
- CatalogCacheManager.js (1340 lines) - IndexedDB cache with LRU eviction
- ServerRegistry.js (327 lines) - Server configuration persistence
- RemoteCatalogClient.js (478 lines) - Multi-server catalog aggregation
- ServerSettingsPanel.js (957 lines) - Settings UI with cache management
- RemoteBootFetcher.js (744 lines) - Streaming downloads with retry
- CatalogFilterBar.js (166 lines) - Filter bar UI
- CatalogSearchBar.js (167 lines) - Search input with debounce
- dhcp_server.py (848 lines) - Async DHCP server with PXE options, production logging
- pxe_cli.py (641 lines) - CLI interface for PXE server management with DHCP, TFTP, and HTTP subcommands
- test_dhcp_server.py (1180 lines) - Unit + integration tests (46 tests)
- tftp_server.py (750 lines) - Async TFTP server with concurrent transfers, aiofiles
- test_tftp_server.py (795 lines) - Unit + integration tests (52 tests)
- http_server.py (553 lines) - Async HTTP server with range requests and catalog integration
- test_http_server.py (1340 lines) - Unit + integration tests (66 tests)

### Blockers
- None currently

## Session Continuity

Last session: 2026-02-28T14:30:00Z
Status: Phase 14 HTTP Container Serving verified and complete
Resume file: None

**Next Action:** Proceed to Phase 15 (Boot Menu) - /gsd:discuss-phase 15
