# Phase 8 Plan 2: Delta Patcher Summary

**Phase:** 08-delta-updates
**Plan:** 02
**Type:** execute
**Completed:** 2026-03-09

## One-Liner

DeltaPatcher applies byte-level delta manifests with checksum validation and ByteFetcher protocol for remote region fetching.

## Objective

Enable clients to update their local .rts.png file by applying a delta manifest, downloading only the changed regions from the server.

## Tasks Completed

| Task | Name                                    | Commit      | Files                              |
| ---- | --------------------------------------- | ----------- | ---------------------------------- |
| 1    | Create PatchError and DeltaPatcher      | fcba2a7f801 | systems/pixel_compiler/delta_patch.py |
| 2-4  | Implement checksum validation and apply | 8df161bb557 | systems/pixel_compiler/delta_patch.py |
| 5    | Add pixelrts patch CLI command          | 4983a5bfb74 | systems/pixel_compiler/pixelrts_cli.py |
| 6    | Create unit tests for delta patch       | 8df161bb557 | tests/unit/test_delta_patch.py |

## Key Implementation Details

### DeltaPatcher Class

- **Checksum Validation:** Validates base file checksum before patching, region checksums during patching, and final output checksum after patching
- **Decode/Encode Cycle:** Reads .rts.png files, decodes to raw bytes, applies patches, encodes back to PNG
- **Atomic Writes:** Uses temp file for in-place patching to ensure atomicity
- **ByteFetcher Protocol:** Protocol for fetching region bytes from remote source (Plan 03)

### CLI Command

```bash
pixelrts patch <base.png> <manifest.json> [-o output.png] [--skip-validation] [-q] [-v]
```

- **Exit Codes:** 0=success, 1=patch error, 2=file not found, 3=invalid manifest, 4=other error
- **In-place Mode:** Default (no -o flag) patches the base file atomically
- **Validation:** Checksum validation on by default, --skip-validation for faster operation

### ByteFetcher Protocol

```python
class ByteFetcher(Protocol):
    def fetch_region(self, offset: int, length: int) -> bytes:
        ...
```

- Used for fetching new region bytes from remote server (Plan 03)
- Without fetcher, patcher validates structure but uses existing bytes from base file

## Test Coverage

**24 tests** in `tests/unit/test_delta_patch.py`:

- PatchError exception (3 tests)
- Checksum validation helpers (5 tests)
- Patch apply scenarios (9 tests): identical, single/multiple regions, growth, shrink, checksum mismatch, output path, in-place
- Skip validation mode (1 test)
- Convenience function (1 test)
- CLI command (4 tests)

## Decisions Made

1. **Decode/Encode Cycle:** DeltaPatcher decodes .rts.png files before patching and encodes back to PNG after. This ensures checksums match the manifest (which uses decoded data checksums).

2. **ByteFetcher Required for New Bytes:** Without a ByteFetcher, the patcher can validate structure and apply unchanged bytes, but cannot fetch new bytes. This is by design - Plan 03 adds HTTP fetching.

3. **Atomic In-place Patching:** Uses temp file + atomic rename to prevent corruption if patch fails mid-write.

4. **Checksum Validation On by Default:** --skip-validation available for performance-critical scenarios or when manifest is trusted.

## Deviations from Plan

None - plan executed exactly as written.

## Verification

```bash
# Generate delta manifest
pixelrts delta old.rts.png new.rts.png -o manifest.json

# Apply with validation (requires byte_fetcher for new bytes)
pixelrts patch base.rts.png manifest.json -o output.rts.png

# Apply without validation (structure only)
pixelrts patch base.rts.png manifest.json -o output.rts.png --skip-validation
```

## Next Phase Readiness

**Ready for Plan 03:** HTTP Region Fetcher

- ByteFetcher protocol is defined and tested
- DeltaPatcher.apply() accepts byte_fetcher parameter
- Need to implement HTTP-based ByteFetcher for remote region fetching

## Metrics

- **Duration:** 11 minutes
- **Commits:** 3
- **Tests Added:** 24 (all passing)
- **Files Created:** 2 (delta_patch.py, test_delta_patch.py)
- **Files Modified:** 1 (pixelrts_cli.py)
