---
phase: 18-ephemeral-boot
plan: 03
subsystem: cli
tags: [argparse, ephemeral, boot, cli, container]

# Dependency graph
requires:
  - phase: 18-01
    provides: EphemeralBooter class for temporary container boot
  - phase: 18-02
    provides: ContainerInfo.is_ephemeral field for tracking
provides:
  - --ephemeral/-e CLI flag for boot command
  - _boot_ephemeral helper function
  - Ephemeral mode message display
  - Unit tests for ephemeral CLI routing
affects: []

# Tech tracking
tech-stack:
  added: []
  patterns: [cli-flag-routing, helper-function-pattern]

key-files:
  created: []
  modified:
    - systems/pixel_compiler/pixelrts_cli.py
    - tests/unit/test_pixelrts_cli_boot.py

key-decisions:
  - "Ephemeral mode handled after container type detection but before BootBridge creation"
  - "Created dedicated _boot_ephemeral helper following _boot_committed pattern"
  - "Used getattr(args, 'ephemeral', False) for safe flag access"

patterns-established:
  - "Helper function pattern: _boot_ephemeral mirrors _boot_committed structure"
  - "Context manager usage: EphemeralBooter used with 'with' for automatic cleanup"

# Metrics
duration: 8min
completed: 2026-03-09
---
# Phase 18 Plan 03: Ephemeral CLI Flag Summary

**Added --ephemeral flag to pixelrts boot command with EphemeralBooter integration for temporary container boot**

## Performance

- **Duration:** 8 min
- **Started:** 2026-03-09T15:20:29Z
- **Completed:** 2026-03-09T15:28:30Z
- **Tasks:** 3
- **Files modified:** 2

## Accomplishments
- Added --ephemeral/-e argument to boot subcommand parser
- Wired ephemeral flag to EphemeralBooter in cmd_boot function
- Created _boot_ephemeral helper with full signal handling and background mode support
- Added 6 unit tests for ephemeral CLI flag functionality

## Task Commits

Each task was committed atomically:

1. **Task 1: Add --ephemeral argument to boot subcommand parser** - `0d6fcce` (feat)
2. **Task 2: Update cmd_boot to use EphemeralBooter when --ephemeral flag set** - `14a64ed` (feat)
3. **Task 3: Add unit tests for --ephemeral CLI flag** - `5c53481` (test)

## Files Created/Modified
- `systems/pixel_compiler/pixelrts_cli.py` - Added --ephemeral flag, _boot_ephemeral helper, routing logic
- `tests/unit/test_pixelrts_cli_boot.py` - Added TestEphemeralBootFlag class with 6 tests

## Decisions Made
- Ephemeral mode checked after container type detection but before BootBridge creation - allows VM_SNAPSHOT detection to work first
- Created dedicated _boot_ephemeral helper following same pattern as _boot_committed for consistency
- Used getattr(args, 'ephemeral', False) for safe flag access in case older code paths don't have the attribute

## Deviations from Plan

None - plan executed exactly as written.

## Issues Encountered

Initial test mocks patched wrong location (module-level instead of import location). Fixed by patching `systems.pixel_compiler.boot.ephemeral_boot.EphemeralBooter` instead of `systems.pixel_compiler.pixelrts_cli.EphemeralBooter`.

## User Setup Required

None - no external service configuration required.

## Next Phase Readiness
- CLI ephemeral flag complete and tested
- Users can now run `pixelrts boot --ephemeral file.rts.png` for temporary containers
- Ready for any additional ephemeral-related CLI features

---
*Phase: 18-ephemeral-boot*
*Completed: 2026-03-09*
