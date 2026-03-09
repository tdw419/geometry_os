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

✓ **VISUAL-01**: User can compare two .rts.png files and see visual diff — v1.1
  - `pixelrts diff <old.png> <new.png>` command
  - Byte-level comparison with Hilbert region highlighting

✓ **VISUAL-02**: Diff highlights changed regions in Hilbert-encoded pixel space — v1.1
  - scipy.ndimage.label for connected component detection
  - Hilbert coordinate mapping (pixel_idx = byte_idx // 4)

✓ **VISUAL-03**: Byte-level statistics (added, removed, changed) — v1.1
  - Per-channel RGBA breakdown
  - Rich terminal output with plain text fallback

✓ **VISUAL-04**: CLI command `pixelrts diff <old.png> <new.png>` — v1.1
  - Exit codes: 0=identical, 1=different, 2=missing, 3=invalid
  - JSON export with --json flag

✓ **NETWORK-01**: User can boot PixelRTS containers over network via PXE — v1.2
  - `pixelrts serve <file.png>` command
  - Proxy DHCP mode on port 4011
  - TFTP server for legacy PXE boot

✓ **NETWORK-02**: NBD block export for .rts.png files — v1.2
  - nbdkit Python plugin with range decoding
  - Memory-efficient serving of large containers

✓ **NETWORK-03**: HTTP boot via iPXE for faster transfers — v1.2
  - HTTPBootServer with byte-range support
  - Chainload from TFTP to HTTP

✓ **DELTA-01**: Delta manifest generation between versions — v1.2
  - `pixelrts delta <old.png> <new.png>` command
  - SHA-256 checksums per region

✓ **DELTA-02**: Delta patch application — v1.2
  - `pixelrts patch <base.png> <manifest.json>` command
  - `pixelrts update <file.png> --server <url>` for remote updates

✓ **DELTA-03**: Delta server integration — v1.2
  - /delta/list and /delta/<file>.json endpoints
  - DeltaHTTPHandler wired to HTTPBootServer

### Validated (v1.3)

✓ **MULTI-01**: Boot multiple containers simultaneously — v1.3
  - `pixelrts boot a.rts.png b.rts.png` command
  - MultiBootManager with concurrent boot orchestration
  - ResourceAllocator for VNC ports and socket paths

✓ **MULTI-02**: Network connectivity between containers — v1.3
  - VirtualNetwork class for QEMU socket netdev
  - NetworkMode.SOCKET_MCAST for multicast mesh
  - Graceful fallback to USER mode on failure

✓ **ORDER-01**: Primary/helper container designation — v1.3
  - ContainerRole enum (PRIMARY/HELPER)
  - --primary CLI flag
  - Ordered boot with primary first, helpers wait

✓ **ORDER-02**: Ordered shutdown — v1.3
  - stop_all_ordered() for reverse-order shutdown
  - Helpers stop first, primary last

✓ **ORDER-03**: Boot progress visibility — v1.3
  - progress_callback for ordered boot events
  - CLI output shows boot order progress

✓ **STATUS-01**: Container status command — v1.3
  - `pixelrts ps` shows running containers
  - Table output with NAME/STATE/VNC/PID columns

✓ **STATUS-02**: Container state tracking — v1.3
  - ContainerState enum (IDLE/LAUNCHING/RUNNING/STOPPED/ERROR)
  - State file at /tmp/pixelrts/containers.json

### Validated (v1.4)

✓ **SNAP-01**: Create snapshot of running container — v1.4
  - VMSnapshotManager with QEMU savevm command
  - Dynamic timeout based on VM memory size

✓ **SNAP-02**: Snapshot captures full container state — v1.4
  - QEMU savevm captures memory, CPU, device state
  - Linear timeout scaling (2GB = 5s baseline)

✓ **SNAP-03**: Snapshot creation is fast — v1.4
  - Timeout formula: (memory_gb / 2) * 5 seconds

✓ **SNAP-04**: Multiple snapshots per container — v1.4
  - No limit on snapshots per container
  - Tracked in ContainerInfo.snapshots

✓ **RESTORE-01**: Restore container to snapshot state — v1.4
  - VMSnapshotManager.restore_snapshot() with QEMU loadvm

✓ **RESTORE-02**: Restore preserves container identity — v1.4
  - RestoreResult.identity_preserved tracks name/VNC port

✓ **RESTORE-03**: Restore handles running container — v1.4
  - VM stays running through restore
  - Post-restore verification

✓ **MGMT-01**: List all snapshots — v1.4
  - `pixelrts snapshots` lists across all containers

✓ **MGMT-02**: Delete snapshot — v1.4
  - `pixelrts snapshot delete <container> <tag>`

✓ **MGMT-03**: Snapshots stored in standard location — v1.4
  - /tmp/pixelrts/snapshots/<container>/metadata.json

✓ **CLI-SNAP-01**: `pixelrts snapshot create <container>` — v1.4
  - Timestamp-based default naming

✓ **CLI-SNAP-02**: `pixelrts snapshot restore <container> <tag>` — v1.4
  - Verbose output with identity/network status

✓ **CLI-SNAP-03**: Timestamp-based naming — v1.4
  - Format: snap-YYYYMMDD-HHMMSS

### Active (v1.5)

- [ ] **COMMIT-01**: Commit running container to new .rts.png file
- [ ] **COMMIT-02**: Committed file preserves disk changes
- [ ] **COMMIT-03**: Committed file includes VM memory state
- [ ] **COMMIT-04**: Commit shows progress
- [ ] **BOOT-COMMIT-01**: Committed file boots with existing command
- [ ] **BOOT-COMMIT-02**: Committed file preserves kernel/initrd
- [ ] **BOOT-COMMIT-03**: Changes visible after boot
- [ ] **CLI-COMMIT-01**: `pixelrts commit <container> <output>` command
- [ ] **CLI-COMMIT-02**: `--snapshot <tag>` flag
- [ ] **CLI-COMMIT-03**: `--no-verify` flag

### Future

- [ ] **VISION-02**: Vision model can detect tampering or corruption
- [ ] **EPHEM-01**: Ephemeral boot from snapshot (changes discarded)
- [ ] **COMMIT-01**: Persist snapshot to new .rts.png file

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

**Shipped v1.1 (2026-03-08):**
- 1 phase, 4 plans completed
- CLI command: diff
- 23 tests passing

**Shipped v1.3 (2026-03-09):**
- 3 phases (9, 10, 11), 12 plans completed
- CLI commands: boot (multi), ps
- 62+ tests passing (multi_boot_manager, 28+ tests passing (virtual_network)
- Multi-container boot with ordered primary/helper pattern
- Virtual networking without root privileges

**Shipped v1.4 (2026-03-09):**
- 3 phases (12, 13, 14), 10 plans completed
- CLI commands: snapshot (create/restore/list/delete), snapshots
- 162 tests passing (snapshot functionality)
- Live VM snapshots via QEMU monitor commands
- Persistent metadata storage for stopped VMs

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
| use existing PixelRTS v2 format | Leverage invested work, maintain compatibility | ✓ Good |
| FUSE filesystem for direct boot | Clean integration with existing tools | ✓ Good |
| Vision model for verification | Unique advantage of visual format | ✓ Good |
| Phase 1: Vision analysis first | Demonstrates core differentiator | ✓ Good |
| MountHelper context manager pattern | RAII-style cleanup | ✓ Good |
| Lazy unmount with fusermount -uz | Stuck mount recovery | ✓ Good |
| Rich library for terminal output | Graceful fallback to plain text | ✓ Good |
| MD5 hash of path for catalog IDs | Stable, collision-resistant | ✓ Good |
| scipy.ndimage.label for regions | Connected component detection | ✓ Good |
| RGBA channel mapping via (byte_idx % 4) | Simple channel extraction | ✓ Good |
| Output limited to 20 regions | Prevent terminal flood | ✓ Good |
| Proxy DHCP mode (port 4011) | Avoid DHCP conflicts | ✓ Good |
| Range decoding in decoder class | Memory-efficient serving | ✓ Good |
| Async orchestrator pattern | Service coordination | ✓ Good |
| Handler interface `handle(path, headers, writer) -> bool` | Clean extensibility | ✓ Good |
| ByteFetcher protocol | Remote region fetching | ✓ Good |
| Decode/encode cycle for checksums | Data integrity | ✓ Good |
| VNC port range 5900-5999 (100 ports) | Thread-safe allocation, UUID5 deterministic IDs | ✓ Good |
| asyncio.gather for concurrent boot | Parallel startup efficiency | ✓ Good |
| run_in_executor for sync-to-async bridge | Clean async integration | ✓ Good |
| ContainerState enum for lifecycle | Clear state machine | ✓ Good |
| Compensating transaction cleanup | Atomic cleanup on failure | ✓ Good |
| cleanup_on_failure=True by default | Safe default | ✓ Good |
| State file at /tmp/pixelrts/containers.json | Persistent state | ✓ Good |
| table output with NAME/STATE/VNC/PID columns | Clear status display | ✓ Good |
| CLI multi-file boot via nargs='+' | Intuitive UX | ✓ Good |
| ContainerRole enum (PRIMARY/HELPER) | Clear ordered boot semantics | ✓ Good |
| Ordered boot pattern (primary first, helpers wait) | Predictable startup order | ✓ Good |
| Ordered shutdown pattern (helpers first, primary last) | Graceful teardown | ✓ Good |
| Progress callback for ordered boot visibility | User feedback | ✓ Good |
| VirtualNetwork class with QEMU socket netdev | No-root networking | ✓ Good |
| NetworkMode enum extension (SOCKET_MCAST, SOCKET_STREAM) | Flexible network modes | ✓ Good |
| Graceful network fallback to USER mode | Robust error handling | ✓ Good |
| VMSnapshotManager via QemuBoot.send_monitor_command() | Reuse existing socket infrastructure | ✓ Good |
| Linear timeout scaling: (memory_gb / 2) * 5 | SNAP-03 requirement for fast snapshots | ✓ Good |
| RestoreState enum for progress tracking | Clear state machine for restore | ✓ Good |
| RestoreResult dataclass with identity_preserved | Verify container identity after restore | ✓ Good |
| SnapshotMetadata separate from VMSnapshotMetadata | Persistence needs differ from runtime | ✓ Good |
| JSON per-container storage at /tmp/pixelrts/snapshots/ | Human-readable, easy to debug | ✓ Good |
| Dual-source listing (VM or storage) | List snapshots even when VM stopped | ✓ Good |
| Timestamp-based naming: snap-YYYYMMDD-HHMMSS | Consistent, sortable snapshot names | ✓ Good |
| Global `pixelrts snapshots` command | Easy listing across all containers | ✓ Good |

---
*Last updated: 2026-03-09 — v1.5 Commit to File started*


