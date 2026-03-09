# Project State

## Project Reference
See: .planning/PROJECT.md (updated 2026-03-09)
**Core value:** Booting an OS should be as visual and intuitive as opening an image file.
**Current focus:** Planning next milestone

## Current Position
Phase: —
Plan: —
Status: Milestone complete
Last activity: 2026-03-09 — v1.3 Multi-Boot milestone complete

Progress: [██████████] v1.3 shipped!

## Accumulated Context

### Decisions
Key decisions archived in `.planning/milestones/`:
- v1.0: FUSE boot, Rich output, vision analysis
- v1.1: scipy regions, RGBA channel mapping, diff command
- v1.2: Proxy DHCP, range decoding, async orchestrator, handler pattern, ByteFetcher
- v1.3: ContainerRole enum, ordered boot pattern, ordered shutdown, progress callbacks, VirtualNetwork class

 NetworkMode extension, graceful fallback

### Pending Todos
None.

### Blockers/Concerns
None.

## Session Continuity
Last session: 2026-03-09
Stopped at: v1.3 milestone complete

**CLI Commands Available:**
- `pixelrts analyze <file.png>` - Vision analysis and verification
- `pixelrts boot <file.png...>` - Boot .rts.png files with QEMU (supports multiple files)
  - Multi-file: `pixelrts boot a.rts.png b.rts.png c.rts.png` - concurrent boot
  - `--primary/-p <name>` - Designate primary container (starts first, stops last)
  - `--network {user,socket_mcast}` - Network mode (default: user/isolated)
  - When using --primary: shows boot order progress (primary first, helpers wait, primary ready)
  - Ordered shutdown: helpers stop first, primary last
  - Network fallback: if socket_mcast fails, falls back to user mode with warning

---
*State updated: 2026-03-09*
