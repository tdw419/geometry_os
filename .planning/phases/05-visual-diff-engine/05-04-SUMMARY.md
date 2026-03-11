# Phase 5 Plan 4: CLI Diff Command Summary

## One-Liner

`pixelrts diff` CLI command with Rich terminal output, JSON export, and exit codes for scripting.

## Metadata

| Property    | Value                           |
| ----------- | ------------------------------- |
| Phase       | 05-visual-diff-engine           |
| Plan        | 04                              |
| Subsystem   | pixel_compiler/cli              |
| Tags        | cli, diff, rich, terminal, json |
| Duration    | ~15 minutes                     |
| Completed   | 2026-03-08                      |

## Dependency Graph

```
requires:
  - 05-02 (Hilbert region detection)
  - 05-03 (Channel statistics)
provides:
  - pixelrts diff CLI command
  - Rich terminal output formatter
  - JSON diff output for scripting
affects:
  - Future visual diff UI
```

## Tech Stack

### Added

- Rich library integration (Console, Table, Panel)

### Patterns

- Graceful fallback: Rich -> plain text
- Exit code convention: 0=identical, 1=different, 2=missing, 3=invalid

## Key Files

### Created

- `tests/unit/test_pixelrts_cli_diff.py` - 7 CLI integration tests

### Modified

- `systems/pixel_compiler/pixelrts_diff.py` - Added format_diff_output(), format_diff_rich()
- `systems/pixel_compiler/pixelrts_cli.py` - Added cmd_diff(), subparser, handler

## Tasks Completed

| Task | Name                              | Commit   | Files                           |
| ---- | --------------------------------- | -------- | ------------------------------- |
| 1    | Add Rich output formatter         | 260f553  | pixelrts_diff.py                |
| 2    | Add cmd_diff to CLI               | dd7b969  | pixelrts_cli.py                 |
| 3    | Add CLI integration tests         | c49d342  | test_pixelrts_cli_diff.py       |
| 4    | Verify diff command works         | (verify) | N/A                             |

## Verification Results

All verification criteria met:

- [x] format_diff_output produces Rich output with fallback
- [x] cmd_diff function added to pixelrts_cli.py
- [x] 'diff' subparser registered in main()
- [x] `pixelrts diff old new` command works
- [x] --json flag produces valid JSON output
- [x] Exit codes correct (0=identical, 1=different, 2+=error)
- [x] Rich output shows byte stats, regions, channels
- [x] Output limited to 20 regions max
- [x] CLI integration tests pass (7/7)

## Deviations from Plan

None - plan executed exactly as written.

## Authentication Gates

None.

## Decisions Made

1. **Rich fallback pattern**: Followed pixelrts_analyze.py pattern with try/except import
2. **Region limit**: 20 regions max to prevent terminal flooding
3. **Exit codes**: Standard Unix convention (0=success, 1=diff, 2=not found, 3=invalid)
4. **JSON serialization**: Exclude numpy arrays from JSON output

## Next Phase Readiness

**Status**: Ready

Phase 5 Visual Diff Engine is now complete. The `pixelrts diff` command provides:

- Byte-level comparison with added/removed/changed classification
- Hilbert space region visualization
- RGBA channel statistics
- Rich terminal output with fallback
- JSON export for scripting
- Exit codes for shell integration

**Available Commands (v1.1)**:
- `pixelrts diff old.rts.png new.rts.png` - Visual diff comparison
- `pixelrts diff old.rts.png new.rts.png --json` - JSON output
