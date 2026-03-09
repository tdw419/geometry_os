# Project State

## Project Reference

See: .planning/PROJECT.md (updated 2026-03-09)

**Core value:** Booting an OS should be as visual and intuitive as opening an image file.
**Current focus:** v1.2 Network Boot - COMPLETE

## Current Position

Phase: —
Plan: —
Status: Milestone Complete
Last activity: 2026-03-09 — v1.2 shipped

Progress: [████████████████████] 100% (v1.2 complete)

## Performance Metrics

**v1.2 Velocity:**
- Plans completed: 10
- Duration: ~80 min total
- Tests: 425 passing

**Cumulative:**
- v1.0: 22 plans
- v1.1: 4 plans
- v1.2: 10 plans
- Total: 36 plans

## Accumulated Context

### Decisions

Key decisions archived in `.planning/milestones/`:
- v1.0: FUSE boot, Rich output, vision analysis
- v1.1: scipy regions, RGBA channel mapping, diff command
- v1.2: Proxy DHCP, range decoding, async orchestrator, handler pattern, ByteFetcher

### Pending Todos

None.

### Blockers/Concerns

None.

## Session Continuity

Last session: 2026-03-09
Stopped at: v1.2 milestone shipped

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
