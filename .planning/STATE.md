# Project State

## Project Reference

See: .planning/PROJECT.md (updated 2026-03-09)

**Core value:** Booting an OS should be as visual and intuitive as opening an image file.
**Current focus:** Phase 9 - Core Multi-Boot Infrastructure

## Current Position

Phase: 9 of 11 (Core Multi-Boot Infrastructure)
Plan: 4 of 5 in current phase
Status: In progress
Last activity: 2026-03-09 — Completed 09-04 PS Command

Progress: [██████░░░░] 80% (4/5 plans in Phase 9)

## Performance Metrics

**v1.2 Velocity:**
- Plans completed: 10
- Duration: ~80 min total
- Tests: 425 passing

**Cumulative:**
- v1.0: 22 plans
- v1.1: 4 plans
- v1.2: 10 plans
- v1.3: 4 plans (in progress)
- Total: 40 plans

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
- **09-04:** State file at /tmp/pixelrts/containers.json, table output with NAME/STATE/VNC/PID columns

### Pending Todos

None.

### Blockers/Concerns

None.

## Session Continuity

Last session: 2026-03-09
Stopped at: Completed 09-04 PS Command plan

**CLI Commands Available (v1.0 + v1.1 + v1.2):**
- `pixelrts analyze <file.png>` - Vision analysis and verification
- `pixelrts boot <file.png>` - Boot .rts.png files with QEMU
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

**v1.3 Commands Added:**
- `pixelrts ps` - List running containers (NAME, STATE, VNC, PID)
  - `--json` - Output as JSON
  - `--state-file <path>` - Custom state file path

---
*State updated: 2026-03-09*
