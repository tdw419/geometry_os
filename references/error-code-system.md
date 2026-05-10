# GEOS Error Code System

## Overview

Geometry OS uses a structured error code system for opcode return values. All errors
are encoded as negative u32 values (two's complement) via `geos_errno()`. Programs
can distinguish error types by checking `r0` against known error codes.

## Encoding

```rust
pub const fn geos_errno(code: u32) -> u32 {
    code.wrapping_neg()  // two's complement negation
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
| GEOS_ENOENT | VSTAT (file not found), VFS fopen, SEEK, UNLINK, RENAME, STAT |
| GEOS_EPERM | Capability-denied VM ops, SPAWNC (insufficient caps), HYPERVISOR (no window) |
| GEOS_EIO | File write/read failures, PNG screenshot, SCREENA I/O, VFS READ/WRITE |
| GEOS_EINVAL | Invalid arguments, invalid mode, bad register, empty config, HYPERVISOR (missing arch/kernel) |
| GEOS_EBADF | Bad register index, bad file descriptor, IOCTL bad cmd, HYPERVISOR bad reg |
| GEOS_EACCES | Read on write-only fd, write on read-only fd (VFS) |
| GEOS_ENFILE | VFS fd table full, pipe table full |
| GEOS_ESRCH | VM not found, process not found, MSGSND target dead |
| GEOS_EBUSY | Mutex already locked, HYPERVISOR already active, snapshot slot busy |
| GEOS_ENOTSUP | Unknown sub-op, unsupported operation |
| GEOS_EEXIST | MKDIR/CREATE when file exists |
| GEOS_EISDIR | OPEN on directory |
| GEOS_ENOSPC | Snapshot table full |
| GEOS_E2BIG | String/buffer too long |
| GEOS_ENOMEM_EXEC | Insufficient memory for EXECP |
| GEOS_ERANGE | Index out of range, dest buffer out of range |
| GEOS_ENAMETOOLONG | Filename exceeds limit |

## Syscall Handler Coverage

All syscall handlers in `src/vm/ops_syscall.rs` (52 geos_errno uses), `src/vfs.rs` (20+ uses),
and `src/vm/ops_host_fs.rs` (65 uses) return structured error codes. The `src/vm/ops_extended.rs`
handler (40 uses) covers IOCTL, device drivers, process control, hypervisor, and trace ops.

Coverage by opcode handler file (as of Phase 344 hardening):
- `ops_syscall.rs`: 52 error returns using geos_errno (OPEN, READ, WRITE, CLOSE, SEEK, IOCTL, PIPE, MSGSND/RCV, SPAWN, KILL, etc.)
- `ops_host_fs.rs`: 65 error returns using geos_errno (FOPEN, FREAD, FWRITE, FCLOSE, FSEEK, FUNLINK, FRENAME, FSTAT, FMKDIR, FLS, etc.)
- `vfs.rs`: 20+ error returns using geos_errno (internal VFS operations, surface loading)
- `ops_extended.rs`: 40 error returns using geos_errno (IOCTL, device drivers, hypervisor, trace, mutex, snapshot)
- `ops_memory.rs`: 0 error returns (LOAD/STORE/PEEK are infallible or return 0)
- `ops_graphics.rs`: 0 error returns (PSET/FILL/RECTF are infallible)
- `mod.rs`: All hypervisor boot paths use geos_errno

No raw `0xFFFFFFxx` error returns remain in production code. The `FD_ERROR` constant
(0xFFFFFFFF) in `src/vfs.rs` is an internal sentinel for fd allocation, not a syscall
return value — VFS fopen maps it to `geos_errno(GEOS_ENFILE)` before returning.

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

- **Phase 344 (hardening)**: Replaced last 4 raw `0xFFFFFFFD`/`0xFFFFFFFC` returns in
  hypervisor boot paths (mod.rs, ops_extended.rs) with proper `geos_errno()` calls.
  Added syscall handler coverage documentation. Updated encoding to match actual
  `code.wrapping_neg()` implementation.
- **Phase 344 (initial)**: Replaced 66+ raw `0xFFFFFFFF`/`0xFFFFFFFE` returns across mod.rs,
  ops_graphics.rs with proper `geos_errno()` calls. Added 7 new error codes
  (GEOS_ENOTSUP through GEOS_ERANGE).
