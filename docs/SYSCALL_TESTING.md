# Pixel-Native Syscall Testing Guide

## Overview

Two approaches to testing the pixel-native syscalls:

### 1. Unit Tests (Current)
- Mock VM state, direct function calls
- Fast iteration, good for logic verification
- Don't test full hypervisor stack

### 2. Real Programs (New)
- Compile RISC-V binaries that call syscalls
- Run through hypervisor OR QEMU
- Tests integration, MMU, privilege transitions

## What We Built

### test_syscalls.c
Comprehensive test suite for pixel-native syscalls:
- mkdir (create, existing dir check, multiple dirs)
- rmdir (remove, error on non-existent)
- chdir (change working directory)
- getcwd (get current working directory)
- dup2 (duplicate file descriptors)

**Build:**
```bash
cd native
./build_test_syscalls.sh
```

**Produces:** `native/test_syscalls` (5.6KB RISC-V ELF binary)

## Running Tests

### Option A: Through Hypervisor (Recommended)
Tests full hypervisor stack + pixel-native syscalls:

```bash
cargo run -- --kernel native/test_syscalls
```

This exercises:
- ELF loader
- RISC-V CPU execution
- ECALL/SRET privilege transitions
- MMU translation (if page tables enabled)
- Pixel-native syscall dispatch
- Spatial file descriptor tables
- VFS pixel operations

### Option B: Direct QEMU (Bypass Hypervisor)
For comparison with non-pixel-native syscalls:

```bash
qemu-system-riscv64 -nographic -machine virt -m 256M -kernel native/test_syscalls
```

**Note:** This will fail with OpenSBI because `test_syscalls.c` is a user program, not a kernel. It doesn't set up page tables or handle the kernel entry point.

## Current Limitation

The test program needs to be loaded as a **user program**, not a kernel. Options:

1. **Create initramfs** - Put `test_syscalls` in initramfs, boot real Linux kernel
2. **Fix hypervisor loader** - Make loader distinguish kernel vs user programs
3. **Write kernel wrapper** - Small kernel that loads and executes test program

Option 1 is quickest if you have a Linux kernel. Option 2 is most general. Option 3 is good for quick iteration.

## How This Helps Us Build

### Integration Testing
Unit tests catch logic bugs, real programs catch integration bugs:
- File descriptor table state persistence
- VFS state across multiple syscalls
- Return path from hypervisor to user program

### Real-World Semantics
What unit tests don't catch:
- `mkdir` followed by `rmdir` - VFS inode recycling
- `chdir` then `getcwd` - process table cwd updates
- `dup2(1, 10)` then `write(10, ...)` - fd table lookup chains

### Incremental Validation
Add syscalls one at a time:
1. Implement `mkdir` - get mkdir tests passing
2. Add `rmdir` - get rmdir + mkdir tests passing
3. Add `chdir` - process state integration
4. Add `getcwd` - readback verification

### Performance Feedback
See real-world syscall overhead:
- Time syscall dispatch
- Measure VFS pixel operations
- Compare vs traditional kernel syscalls

## Next Steps

### Immediate
1. **Create initramfs wrapper** - Boot Linux kernel with test program
2. **Run through hypervisor** - See what breaks
3. **Fix failures** - Address MMU, fd table, VFS state issues

### Longer Term
1. **Add more tests** - fork, execve, openat, read, write, pipe2
2. **Performance benchmarks** - Measure syscall latency
3. **Fuzzing** - Random syscall sequences
4. **Guest OS testing** - Boot xv6 or Linux, run real programs

## Files Created

- `native/test_syscalls.c` - Test program (329 lines)
- `native/build_test_syscalls.sh` - Build script
- `native/test_syscalls` - Compiled RISC-V binary

## Test Output

Expected output when tests pass:

```
=== Pixel-Native Syscall Tests ===
Testing hypervisor syscall implementation

[TEST] mkdir_create
  PASS

[TEST] mkdir_multiple
  PASS

[TEST] rmdir_remove
  PASS

[TEST] chdir_simple
  PASS

[TEST] getcwd_basic
  PASS

[TEST] dup2_basic
  dup2_write

=== SUMMARY ===
Total: 6
Passed: 6
Failed: 0
```

If tests fail, the hypervisor will show:
- Which syscall failed
- Error code/return value
- Console output from test program

## Comparison: xv6 vs Real Testing

| Aspect | Unit Tests | Real Programs |
|--------|-----------|---------------|
| Speed | Milliseconds | Seconds |
| MMU | satp=0 only | Full page tables |
| Context | Mock CPU state | Real CPU state |
| Integration | None | Full hypervisor stack |
| Debugging | Easy | Medium |
| Realism | Low | High |

Use unit tests for logic, real programs for integration. Both needed.