# GEOS Error Code System

## Overview

Geometry OS uses a structured error code system for opcode return values. All errors
are encoded as negative u32 values (two's complement) via `geos_errno()`. Programs
can distinguish error types by checking `r0` against known error codes.

## Encoding

```rust
pub const fn geos_errno(code: u32) -> u32 {
    (!code).wrapping_add(1)  // two's complement negation
}
```

Example: `geos_errno(GEOS_ENOENT)` = `0xFFFFFFFE` (which is `-2` as i32).

```asm
; Check for specific error after an opcode
OPEN r10, r11        ; r0 = fd on success, or geos_errno(code) on failure
LDI r20, 0xFFFFFFFE  ; GEOS_ENOENT
CMP r0, r20
JZ r0, file_not_found
; ... handle other errors ...
```

## Error Code Table

| Code | Value | geos_errno() | Description |
|------|-------|-------------|-------------|
| GEOS_ENOMEM | 1 | 0xFFFFFFFF | Out of memory / no slots available |
| GEOS_ENOENT | 2 | 0xFFFFFFFE | No such file or directory |
| GEOS_EPERM | 3 | 0xFFFFFFFD | Operation not permitted (capability denied) |
| GEOS_EIO | 4 | 0xFFFFFFFC | I/O error (read/write failed) |
| GEOS_EISDIR | 5 | 0xFFFFFFFB | Is a directory (can't open dir as file) |
| GEOS_ENOSPC | 6 | 0xFFFFFFFA | No space left on device |
| GEOS_EINVAL | 7 | 0xFFFFFFF9 | Invalid argument |
| GEOS_EBADF | 8 | 0xFFFFFFF8 | Bad file descriptor |
| GEOS_EACCES | 9 | 0xFFFFFFF7 | Permission denied (wrong mode) |
| GEOS_ENFILE | 10 | 0xFFFFFFF6 | File table overflow (too many open files) |
| GEOS_ESRCH | 11 | 0xFFFFFFF5 | No such process (for MSGSND, VM ops) |
| GEOS_EBUSY | 12 | 0xFFFFFFF4 | Resource busy (mutex already locked) |
| GEOS_ENOTSUP | 13 | 0xFFFFFFF3 | Operation not supported |
| GEOS_EEXIST | 14 | 0xFFFFFFF2 | File already exists |
| GEOS_ENAMETOOLONG | 15 | 0xFFFFFFF1 | File name too long |
| GEOS_EAGAIN | 16 | 0xFFFFFFF0 | Resource temporarily unavailable |
| GEOS_E2BIG | 17 | 0xFFFFFFEF | Argument list too long |
| GEOS_ENOMEM_EXEC | 18 | 0xFFFFFFEE | Insufficient memory for execution |
| GEOS_ERANGE | 19 | 0xFFFFFFED | Result out of range / index out of bounds |

## Detection Helper

```rust
pub const fn is_geos_errno(val: u32) -> bool {
    val >= 0xFFFFFFF0  // codes 1-16 map to 0xFFFFFFF0..0xFFFFFFFF
}
```

## Error Code Assignment Convention

| Error Code | Used By |
|-----------|---------|
| GEOS_ENOMEM | ALARM (no free slots), SPAWN (max processes), SPRITE_LOAD |
| GEOS_ENOENT | VSTAT (file not found), VFS operations |
| GEOS_EPERM | Capability-denied VM ops, SPAWNC (insufficient caps) |
| GEOS_EIO | File write/read failures, PNG screenshot, SCREENA I/O |
| GEOS_EINVAL | Invalid arguments, invalid mode, bad register, empty config |
| GEOS_EBADF | Bad register index, bad file descriptor |
| GEOS_ESRCH | VM not found, process not found |
| GEOS_ENOTSUP | Unknown sub-op, unsupported operation |
| GEOS_ERANGE | Index out of range, dest buffer out of range |

## Sentinel Values (NOT Error Codes)

These use 0xFFFFFFFF but are NOT error codes — they're data conventions:

- **CMP result**: `r0 = 0xFFFFFFFF` means "less than" (part of CMP opcode contract)
- **Hash table miss**: `regs[dr] = 0xFFFFFFFF` as sentinel for "key not found"
- **CMP instruction encoding**: `0xFFFFFFFF` as the canonical "less than" comparison result

These should NOT be replaced with `geos_errno()` — they're part of the ISA contract.

## Audit Methodology

To verify all error returns use geos_errno():

```bash
# Find raw error returns in production code (not test code, not CMP results)
grep -n 'self.regs\[0\] = 0xFFFFFFFF' src/vm/mod.rs
grep -n 'self.ram\[0xFF[AD]\] = 0xFFFFFFFF' src/vm/mod.rs
grep -n 'self.regs\[0\] = 0xFFFFFFFE' src/vm/mod.rs

# Count geos_errno usage
grep -c 'geos_errno(' src/vm/mod.rs src/vm/ops_extended.rs src/vm/ops_graphics.rs
```

## History

- **Phase 344**: Replaced 66+ raw `0xFFFFFFFF`/`0xFFFFFFFE` returns across mod.rs,
  ops_graphics.rs with proper `geos_errno()` calls. Added 7 new error codes
  (GEOS_ENOTSUP through GEOS_ERANGE).
