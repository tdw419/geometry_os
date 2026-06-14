# Using xv6/RISC-V to Test Pixel-Native Syscalls

## TL;DR

Yes, we can and should use real RISC-V programs to test our pixel-native syscalls. This catches integration bugs unit tests miss.

## What We Built

1. **Test Program** (`native/test_syscalls.c`) - 329 lines, exercises all syscalls
2. **Build Script** (`native/build_test_syscalls.sh`) - Compiles to RISC-V ELF
3. **Run Script** (`run_syscall_tests.sh`) - Launches through hypervisor
4. **Documentation** (`docs/SYSCALL_TESTING.md`) - Full guide

## The Problem with Unit Tests

Current unit tests in `src/riscv/pixel_native/tests.rs`:

```rust
let (mut cpu, mut bus) = setup_vm();
cpu.x[10] = pathname_ptr;  // Manually set registers
syscall_mkdir_pixel_native(&mut cpu, &mut bus);  // Direct call
```

**What this tests:**
- Syscall logic
- VFS pixel operations
- Process table updates

**What this doesn't test:**
- Real ECALL/SRET transitions
- MMU page table walks
- Actual stack/heap layout
- File descriptor state persistence
- Return path from hypervisor to user program

## The Solution: Real Programs

Write C programs that call syscalls normally:

```c
int main() {
    int ret = mkdir("testdir", 0755);
    if (ret == 0) {
        write(1, "PASS\n", 5);
    }
    exit(ret);
}
```

Compile with cross-compiler:
```bash
riscv64-linux-gnu-gcc -static -Os -o test_mkdir test_mkdir.c
```

Run through hypervisor:
```bash
cargo run -- --kernel test_mkdir
```

## How This Helps Us Build

### 1. Integration Testing

Unit test: `mkdir` succeeds
Real program: `mkdir` → `rmdir` → `mkdir` (same name)

Real program catches: inode recycling, VFS state management

### 2. Real MMU Behavior

Unit test: `satp=0` (identity mapping)
Real program: Page tables, TLB, permission checks

Real program catches: address translation bugs, privilege transitions

### 3. Process State

Unit test: Mock CPU registers
Real program: Real stack, heap, BSS segments

Real program catches: stack growth, heap allocation, BSS zeroing

### 4. End-to-End Validation

Unit test: Call function directly
Real program: ECALL → hypervisor dispatch → syscall → return → user space

Real program catches: return value passing, register restoration

## Incremental Development

Start simple, build complexity:

```
1. Implement mkdir
   → test_mkdir.c creates directory
   → Fixes: VFS allocation, pathname lookup

2. Add rmdir
   → test_rmdir.c creates, removes directory
   → Fixes: inode deallocation, VFS cleanup

3. Add chdir
   → test_chdir.c changes directory
   → Fixes: process table cwd updates

4. Add getcwd
   → test_getcwd.c verifies cwd
   → Fixes: VFS readback, string copying

5. Add all syscalls
   → test_syscalls.c exercises everything
   → Fixes: integration bugs, state persistence
```

## What We Currently Have

Built and ready to test:
- `native/test_syscalls` - Compiled RISC-V binary (5.6KB)
- Tests mkdir, rmdir, chdir, getcwd, dup2
- 6 test cases with pass/fail reporting

To run:
```bash
./run_syscall_tests.sh
```

## Expected Behavior

When tests pass:
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

When tests fail, hypervisor shows:
- Which syscall returned error
- Error code or fault reason
- Console output from test program

## Next Steps

### Immediate
1. **Run the tests** - See what breaks
2. **Fix failures** - Address MMU, VFS, process state bugs
3. **Add more syscalls** - fork, execve, openat, read, write, pipe2

### Integration
1. **Boot xv6** - Run real xv6 user programs
2. **Boot Linux** - Test with standard Linux tools
3. **Performance testing** - Measure syscall latency

### Automation
1. **CI pipeline** - Run tests on every commit
2. **Fuzzing** - Random syscall sequences
3. **Regression suite** - Catch future breakage

## Files

- `native/test_syscalls.c` - Test program source
- `native/build_test_syscalls.sh` - Build script
- `run_syscall_tests.sh` - Run script
- `docs/SYSCALL_TESTING.md` - Full documentation

## Summary

**Unit tests verify logic. Real programs verify integration.**

Use both. Unit tests are fast for development iteration. Real programs catch bugs unit tests miss.

The test suite is ready. Run it and see what breaks.