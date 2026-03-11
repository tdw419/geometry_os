# Project State

## Project Reference

See: .planning/PROJECT.md (updated 2026-03-09)

**Core value:** Booting an OS should be as visual and intuitive as opening an image file.
**Current focus:** Phase 10 - Boot Ordering Dependencies

## Current Position

Phase: 10 of 11 (Boot Ordering Dependencies)
Plan: 3 of 3 in current phase
Status: Phase complete
Last activity: 2026-03-09 — Completed 10-03 ordered shutdown implementation

Progress: [███████████] 100% (3/3 plans in Phase 10)

## Performance Metrics

**v1.2 Velocity:**
- Plans completed: 10
- Duration: ~80 min total
- Tests: 425 passing

**Cumulative:**
- v1.0: 22 plans
- v1.1: 4 plans
- v1.2: 10 plans
- v1.3: 5 plans (complete)
- v1.4: 4 plans (planned,- Total: 45 plans

## Accumulated Context

### Decisions

Key decisions archived in `.planning/milestones/`:
- v1.0: FUSE boot, Rich output, vision analysis
- v1.1: scipy regions, RGBA channel mapping, diff command
- v1.2: Proxy DHCP, range decoding, async orchestrator, handler pattern, ByteFetcher

**v1.3 Decisions (from research):**
- QEMU socket netdev over TAP/bridge (no root required)
- asyncio subprocess orchestration (no external dependencies)
- Composition pattern: MultiBootManager wraps BootBridge instances
- **09-01:** VNC port range 5900-5999 (100 ports), thread-safe allocation, UUID5 deterministic IDs
- **09-02:** asyncio.gather for concurrent boot, run_in_executor for sync-to-async bridge, ContainerState enum for lifecycle
- **09-03:** Compensating transaction cleanup on partial failure, cleanup_on_failure=True by default, resources released on boot failure
    - **09-04:** State file at /tmp/pixelrts/containers.json, table output with NAME/STATE/VNC/PID columns
    - **09-05:** CLI multi-file boot via nargs='+', exit code 0 on partial success, cleanup_on_failure default True

**v1.4 Decisions:**
- **10-01:** ContainerRole enum (PRIMARY/HELPER) for ordered boot, default HELPER role, --primary CLI flag
- **10-02:** Ordered boot pattern (primary first, wait for RUNNING, helpers concurrently), primary failure aborts helpers, backward compatible concurrent boot when no primary
    - **10-03:** Ordered shutdown pattern (helpers first, primary last)
 stop_all_ordered() method, CLI uses ordered shutdown when --primary specified
    - **10-04:** Progress callback pattern for ordered boot visibility (primary_start, primary_ready, helpers start, helper_ready) callback only for ordered boot

### Pending Todos

None.

### Blockers/Concerns
None.

## Session Continuity
Last session: 2026-03-09
Stopped at: Completed 10-04 Boot Progress Visibility plan

**CLI Commands Available (v1.0 + v1.1 + v1.2 + v1.3+ v1.4):**
- `pixelrts analyze <file.png>` - Vision analysis and verification
- `pixelrts boot <file.png...>` - Boot .rts.png files with QEMU (supports multiple files)
    - Multi-file: `pixelrts boot a.rts.png b.rts.png c.rts.png` - concurrent boot
    - `--primary/-p <name>` - Designate primary container (starts first, stops last)
    - `pixelrts install <file.png> <target>` - Install .rts.png to disk image
    - `pixelrts catalog` - Launch visual catalog server
    - `pixelrts diff <old.png> <new.png>` - Visual diff comparison
    - `pixelrts delta <old.png> <new.png>` - Generate delta manifest
    - `pixelrts patch <base.png> <manifest.json>` - Apply delta manifest
    - `pixelrts update <file.png> --server <url>` - Update via delta from server
    - `pixelrts serve <file.png>` - Start network boot services
        - `--http` - Enable HTTP boot for faster transfers
        - `--delta` - Enable delta manifest serving
        - `--delta-from <old.png>` - Generate initial delta
    - `pixelrts ps` - List running containers (NAME, STATE, VNC, PID)
        - `--json` - Output as JSON
        - `--state-file <path>` - Custom state file path
    - `pixelrts boot --ordered --primary/-p <name>` - Ordered boot with progress visibility
        - `pixelrts boot --ordered` - Graceful shutdown when Ctrl+C

- `pixelrts stop --ordered` - Stop containers in reverse order

- `pixelrts ps --ordered` - Shows boot order and with roles

- `pixelrts ps --role` - Shows container roles (primary/helper)

---

*State updated: 2026-03-09*
