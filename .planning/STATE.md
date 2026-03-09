# Project State

## Project Reference
See: .planning/PROJECT.md (updated 2026-03-09)
**Core value:** Booting an OS should be as visual and intuitive as opening an image file.
**Current focus:** Phase 11 complete - Virtual Networking

## Current Position
Phase: 11 of 11 (Virtual Networking)
Plan: 3 of 3 in current phase
Status: Phase complete
Last activity: 2026-03-09 — Completed 11-03: MultiBootManager virtual network integration

Progress: [██████████] Phase 11: 3/3 plans complete

## Performance Metrics
**v1.2 Velocity:**
- Plans completed: 10
- Duration: ~80 min total
- Tests: 425 passing
**v1.3 Velocity:**
- Plans completed: 4
- Duration: ~15 min total
- Tests: 50 passing (59 total tests)

**Cumulative:**
- v1.0: 22 plans
- v1.1: 4 plans
- v1.2: 10 plans
- v1.3: 5 plans (complete)
- v1.4: 4 plans (complete)
- v1.5: 3 plans (complete)
- Total: 52 plans

## Accumulated Context

### Decisions
Key decisions archived in `.planning/milestones/`:
- v1.0: FUSE boot, Rich output, vision analysis
- v1.1: scipy regions, RGBA channel mapping, diff command
- v1.2: Proxy DHCP, range decoding, async orchestrator, handler pattern, ByteFetcher
**v1.3 Decisions (from research):**
- QEMU socket netdev over TAP/bridge (no root required)
- asyncio subprocess orchestration (no external dependencies)
- composition pattern: MultiBootManager wraps BootBridge instances
- **09-01:** VNC port range 5900-5999 (100 ports), thread-safe allocation, UUID5 deterministic IDs
- **09-02:** asyncio.gather for concurrent boot, run_in_executor for sync-to-async bridge, ContainerState enum for lifecycle
- **09-03:** Compensating transaction cleanup on partial failure, cleanup_on_failure=True by default, resources released on boot failure
- **09-04:** State file at /tmp/pixelrts/containers.json, table output with NAME/STATE/VNC/PID columns
- **09-05:** CLI multi-file boot via nargs='+', exit code 0 on partial success, cleanup_on_failure default True
**v1.4 Decisions:**
- **10-01:** ContainerRole enum (PRIMARY/HELPER) for ordered boot, default HELPER role, --primary CLI flag
- **10-02:** Ordered boot pattern (primary first, wait for RUNNING, helpers concurrently), primary failure aborts helpers, backward compatible concurrent boot when no primary
- **10-03:** Ordered shutdown pattern (helpers first, primary last), stop_all_ordered() method, CLI uses ordered shutdown when --primary specified
- **10-04:** Progress callback pattern for ordered boot visibility (primary_start, primary_ready, helpers_start, helper_ready), callback only for ordered boot
**v1.5 Decisions:**
- **11-01:** VirtualNetwork class for QEMU socket netdev with multicast, default mcast 230.0.0.1:1234, no root required, virtio-net-pci device
- **11-02:** Extended NetworkMode enum with SOCKET_MCAST and SOCKET_STREAM, integrated VirtualNetwork into QemuBoot, SOCKET_STREAM stubbed as NotImplementedError
- **11-03:** Graceful network fallback in MultiBootManager, network_fallback flag in ContainerInfo, --network CLI option, default USER mode preserved

### Pending Todos
None.

### Blockers/Concerns
None.

## Session Continuity
Last session: 2026-03-09
Stopped at: Completed 11-03-PLAN.md (MultiBootManager virtual network integration)

**CLI Commands Available (v1.0 + v1.1 + v1.2 + v1.3 + v1.4 + v1.5):**
- `pixelrts analyze <file.png>` - Vision analysis and verification
- `pixelrts boot <file.png...>` - Boot .rts.png files with QEMU (supports multiple files)
  - Multi-file: `pixelrts boot a.rts.png b.rts.png c.rts.png` - concurrent boot
  - `--primary/-p <name>` - Designate primary container (starts first, stops last)
  - `--network {user,socket_mcast}` - Network mode (default: user/isolated)
  - When using --primary: shows boot order progress (primary first, helpers wait, primary ready)
  - Ordered shutdown: helpers stop first, primary last
  - Fallback warning: displays if virtual network setup fails

---
*State updated: 2026-03-09*
