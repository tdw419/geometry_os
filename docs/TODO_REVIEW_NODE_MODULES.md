# TODO Review: node_modules Dependencies

## Date: 2026-03-11

## Summary

This document records the review of TODO comments found in third-party dependencies within `node_modules/` directories.

## Decision

**No implementation required.** TODO comments in `node_modules/` are excluded from project TODO tracking.

## Rationale

1. **Third-Party Code**: Files in `node_modules/` are managed by npm/yarn and are not part of the Geometry OS codebase
2. **Excluded from Version Control**: `node_modules/` is in `.gitignore` and not tracked by git
3. **Upstream Responsibility**: TODOs in dependencies are the responsibility of the upstream package maintainers
4. **Ephemeral**: Any changes would be overwritten on `npm install` or dependency updates

## Reviewed Files

### 2026-03-11: `systems/visual_shell/electron/node_modules/@electron/rebuild/node_modules/node-gyp/gyp/pylib/packaging/metadata.py`

**TODO Comments**:
1. **Line 217-221**: Case sensitivity handling for project URL keys
   ```python
   # TODO: The spec doesn't say anything about if the keys should be
   #       considered case sensitive or not... logically they should
   #       be case-preserving and case-insensitive, but doing that
   #       would open up more cases where we might have duplicate
   #       entries.
   ```

2. **Line 773**: Description field body handling for metadata 2.1
   ```python
   description: _Validator[Optional[str]] = _Validator()  # TODO 2.1: can be in body
   ```

**Source**: Python `packaging` library (bundled with node-gyp)
**Upstream**: https://github.com/pypa/packaging
**Action**: None required - these are upstream library TODOs

## Policy

When encountering TODO comments in `node_modules/`:

1. **Verify it's third-party code** - Check if the file is in a dependency directory
2. **Document the finding** - Record in this file for audit purposes
3. **Do not modify** - Changes would be lost on dependency updates
4. **Report upstream if critical** - For security or critical bugs, report to the upstream maintainer

## Exclusion Pattern

To find actionable TODOs in the project (excluding node_modules):

```bash
# Find TODOs in project code, excluding node_modules
grep -r "TODO" --include="*.py" --include="*.rs" --include="*.ts" --include="*.js" --exclude-dir=node_modules .
```
