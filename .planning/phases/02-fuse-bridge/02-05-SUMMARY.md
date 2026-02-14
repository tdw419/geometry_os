# Phase 02 Plan 05: CLI Boot Subcommand Summary

---
phase: 02-fuse-bridge
plan: 05
subsystem: cli
tags: [cli, boot, qemu, fuse, integration]
completed: 2026-02-14
duration: 3min
---

## One-Liner

Added `pixelrts boot` CLI subcommand enabling single-command booting of .rts.png files with BootBridge integration.

## Summary

Implemented the user-facing `pixelrts boot` command that exposes the BootBridge functionality through the existing CLI. Users can now boot .rts.png files with a single command, specifying memory, CPUs, VNC display, kernel command line, and extra QEMU arguments.

## Decisions Made

| Decision | Rationale | Alternatives Considered |
|----------|-----------|------------------------|
| Python entry point for bin/pixelrts | Maintains consistency with pixelrts_cli.py module structure | Bash wrapper (less portable, harder to maintain) |
| Return 130 for SIGINT | Standard Unix convention (128 + signal number) | Return 1 (loses signal info) |
| Background mode with --background flag | Explicit opt-in for non-blocking behavior | Always wait (limits automation use cases) |

## Key Changes

### systems/pixel_compiler/pixelrts_cli.py

- Added `cmd_boot()` function:
  - Validates input file exists and is a file
  - Creates BootBridge with memory, cpus, vnc_display, verbose options
  - Calls bridge.boot() with cmdline and extra_qemu_args
  - Handles success/failure with appropriate exit codes
  - Waits for QEMU unless --background flag is set
  - Catches SIGINT/SIGTERM and returns 130

- Added boot subparser with arguments:
  - input (positional): Input .rts.png file path
  - --memory/-m: Memory allocation (default: 2G)
  - --cpus/-c: CPU cores (default: 2)
  - --vnc: VNC display number (default: 0)
  - --background/-b: Run in background
  - --cmdline: Additional kernel command line
  - --qemu-arg: Extra QEMU arguments (can be multiple)
  - --quiet/-q: Suppress progress
  - --verbose/-v: Enable verbose output

- Updated help text with boot command and examples
- Added 'boot': cmd_boot to handlers dictionary

### bin/pixelrts

- Converted from bash wrapper to Python entry point
- Imports main() from systems.pixel_compiler.pixelrts_cli
- Properly handles module path resolution

## Files Modified

| File | Changes |
|------|---------|
| systems/pixel_compiler/pixelrts_cli.py | Added cmd_boot function, boot subparser, handler registration |
| bin/pixelrts | Converted to Python entry point |

## Verification

```bash
# Verify boot command help
python3 -m systems.pixel_compiler.pixelrts_cli boot --help
./bin/pixelrts boot --help

# Example usage (requires valid .rts.png file)
./bin/pixelrts boot alpine.rts.png --memory 4G --cpus 4
./bin/pixelrts boot kernel.rts.png --vnc 1 --background
./bin/pixelrts boot os.rts.png --cmdline "console=ttyS0" --qemu-arg "-nographic"
```

## Success Criteria Met

- [x] Single command boot works: `pixelrts boot file.png`
- [x] All boot options are accessible via CLI (memory, cpus, vnc, cmdline, qemu-arg, background, quiet, verbose)
- [x] Consistent with existing CLI patterns (argparse, handlers dictionary)
- [x] CLI returns appropriate exit codes (0=success, 1=error, 130=SIGINT)

## Dependencies

### Requires
- 02-04: Progress Integration (BootProgress for visual feedback)
- 02-03: BootBridge class
- 02-02: MountHelper class
- 02-01: FUSE filesystem infrastructure

### Provides
- User-facing `pixelrts boot` command
- Single-command boot experience
- CLI access to all boot options

### Affects
- Future phases can use this as the primary boot interface

## Deviations from Plan

None - plan executed exactly as written.

## Authentication Gates

None encountered during execution.

## Next Steps

1. Add integration tests for boot command
2. Consider adding `--serial` option for serial console access
3. Add `--monitor` option for QEMU monitor access
