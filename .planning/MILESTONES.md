# Project Milestones: PixelRTS

## v1.4 Live Snapshots (Shipped: 2026-03-09)

**Delivered:** Create and restore snapshots of running containers with persistent metadata storage.

**Phases completed:** 12-14 (10 plans total)

**Key accomplishments:**

- VMSnapshotManager wraps QEMU monitor commands (savevm, loadvm, delvm)
- Dynamic timeout scaling based on VM memory size (2GB = 5s baseline)
- RestoreState enum for progress tracking (PENDING → VALIDATING → LOADING → VERIFYING → COMPLETE)
- RestoreResult with identity preservation and network reconnection tracking
- SnapshotStorage for persistent metadata at /tmp/pixelrts/snapshots/
- Dual-source listing (live from VM when running, stored when stopped)
- Timestamp-based naming: snap-YYYYMMDD-HHMMSS
- Global `pixelrts snapshots` command to list across all containers

**Stats:**

- 3 phases (12, 13, 14), 10 plans
- Timeline: Mar 9, 2026 (1 session)
- 162 tests passing (77 vm_snapshot + 11 storage + 42 cli + 9 bridge + 23 manager)
- ~7,648 lines added

**Git tag:** v1.4

---

## v1.3 Multi-Boot (Shipped: 2026-03-09)

**Delivered:** Boot and manage multiple containers simultaneously with ordered boot/shutdown and virtual networking.

**Phases completed:** 9-11 (12 plans total)

**Key accomplishments:**

- MultiBootManager for concurrent container orchestration
- ContainerRole enum (PRIMARY/HELPER) with ordered boot pattern
- VirtualNetwork class for QEMU socket netdev without root
- NetworkMode.SOCKET_MCAST for multicast mesh networking
- Graceful network fallback to USER mode on failure
- Ordered shutdown (helpers first, primary last)
- `pixelrts ps` status command with table output
- ContainerState enum and persistent state tracking

**Stats:**

- 3 phases (9, 10, 11), 12 plans
- Timeline: Mar 9, 2026 (1 session)
- 90+ tests passing (multi_boot_manager, virtual_network)

**Git tag:** v1.3

---

## v1.2 Network Boot (Shipped: 2026-03-09)

**Delivered:** PXE/NBD network boot with HTTP chainload and delta updates.

**Phases completed:** 6-8.1 (10 plans total)

**Key accomplishments:**

- `pixelrts serve <file.png>` command for network boot services
- Proxy DHCP mode (port 4011) without conflicting with existing DHCP
- NBD block export via nbdkit Python plugin with range decoding
- HTTP boot via iPXE chainload for faster transfers
- Delta manifest generation and patch application
- `/delta/` HTTP endpoints for bandwidth-efficient updates

**Stats:**

- 4 phases (6, 7, 8, 8.1), 10 plans
- Timeline: Mar 8-9, 2026
- 425 tests passing

**Git tag:** v1.2

---

## v1.1 Visual Diff (Shipped: 2026-03-08)

**Delivered:** Visual byte-level comparison for .rts.png files with Hilbert space visualization.

**Phases completed:** 5 (4 plans total)

**Key accomplishments:**

- `pixelrts diff <old> <new>` command for visual comparison
- Byte-level statistics: added, removed, changed counts
- Hilbert space region highlighting with scipy.ndimage.label
- RGBA channel breakdown with per-channel deltas
- Rich terminal output with plain text fallback
- JSON export for scripting, exit codes for shell integration

**Stats:**

- 1 phase, 4 plans
- Timeline: Mar 8, 2026 (1 session)
- 23 tests passing (16 unit + 7 CLI)

**Git range:** Phase 5 start → Phase 5 complete

---

## v1.0 PixelRTS Boot (Shipped: 2026-03-08)

**Delivered:** Complete OS boot system from .rts.png files with visual analysis, direct boot, installer, and catalog.

**Phases completed:** 1-4 (22 plans total)

**Key accomplishments:**

- Vision analysis pipeline identifies OS containers through visual analysis
- FUSE bridge enables direct PNG boot without extraction (`pixelrts boot`)
- Visual installer with progress feedback (`pixelrts install`)
- Visual catalog manager with thumbnail gallery (`pixelrts catalog`)
- 90+ tests across boot, install, catalog

**Stats:**

- 4 phases, 22 plans
- Timeline: Feb 8 - Feb 17, 2026 (~9 days)
- CLI commands: analyze, boot, install, catalog

**Git range:** Phase 1 → Phase 4

---

*Last milestone: v1.4 (2026-03-09)*
