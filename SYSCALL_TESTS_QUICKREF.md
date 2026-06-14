# Syscall Testing Quick Reference

## Build Test Program
```bash
cd native
./build_test_syscalls.sh
```

## Run Through Hypervisor
```bash
./run_syscall_tests.sh
```

## Or Direct
```bash
cargo run -- --kernel native/test_syscalls
```

## Tests Covered
- mkdir (create, existing, multiple)
- rmdir (remove, error handling)
- chdir (change directory)
- getcwd (get current directory)
- dup2 (duplicate file descriptors)

## Expected Output
```
[TEST] mkdir_create
  PASS

[TEST] mkdir_multiple
  PASS

...

=== SUMMARY ===
Total: 6
Passed: 6
Failed: 0
```

## If Tests Fail
1. Check hypervisor console for syscall errors
2. Verify VFS pixel operations
3. Check process table state
4. Debug with unit tests first, then real programs

## Documentation
- `docs/SYSCALL_TESTING.md` - Full guide
- `docs/XV6_TESTING_GUIDE.md` - xv6 testing approach
- `native/test_syscalls.c` - Test program source

## Why Real Programs?
- Tests full hypervisor stack
- Catches integration bugs
- Real MMU/page table behavior
- Process state persistence