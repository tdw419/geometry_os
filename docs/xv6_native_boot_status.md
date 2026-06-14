# xv6 Native Boot Status

## Current Status: Core Complete, tinycalc Crashes

### Working Components ✅

- xv6 kernel boots and initializes all subsystems
- Sv32 MMU with proper page tables
- M→S→U privilege transitions (mret → sret)
- User-mode syscall delegation working correctly
- `/syscall_test` runs successfully with write() and exit() syscalls
- `/echo` runs successfully
- Multiple syscalls execute without stack corruption
- Programs exit cleanly

### Known Issues ⚠️

**tinycalc crashes with LoadFault:**
```
[sret] After: pc=0x00000682 priv=User sp=0x7ffff000
[cpu] TRAP: cause=0x0000000D tval=0xF787A783 at PC=0x80000A48 priv=Supervisor
=== FAULT at instr 744492: LoadFault ===
PC=0x80000000 scause=0x00000008 stval=0x00000000
```

**Analysis:**
- Crash happens in kernel space (Supervisor mode) after sret
- Trying to read invalid address 0xF787A783 (not a valid user address)
- Suggests memory corruption or uninitialized pointer

**tinycalc Requirements:**
- printf() ✅ (uses sys_write)
- memset() ✅ (standard libc)
- gets() ❌ (uses sys_read, needs console input)
- open() ❌ (uses sys_open)
- read() ❌ (uses sys_read)
- close() ❌ (uses sys_close)
- exit() ✅ (uses sys_exit)

**Root Cause:**
tinycalc is being launched with argc=1 (no arguments), so it enters the interactive REPL mode which tries to read from stdin. The sys_read syscall is declared in syscall.c but may not be fully implemented or may be causing the crash when accessing console input.

### Test Programs Status

| Program | Status | Notes |
|---------|--------|-------|
| /syscall_test | ✅ WORKING | Tests sys_write and sys_exit |
| /echo | ✅ WORKING | Simple write syscall test |
| /tinycalc | ❌ CRASHES | Missing sys_read, sys_open, sys_close |
| /cat | ❌ UNTESTED | Needs sys_open, sys_read |
| /ls | ❌ UNTESTED | Needs sys_open, sys_readdir |
| /sh | ❌ UNTESTED | Needs many syscalls |
| /init | ❌ UNTESTED | Needs fork, exec, wait |

## Next Steps

### Immediate: Debug tinycalc Crash

1. **Check sys_read implementation** - Look at conductor/tracks/xv6-rv32/kernel/sysfile.c
2. **Verify sysfile.o is linked** - Makefile has it, but double-check
3. **Add debug output** - Print which syscall is being called
4. **Try simpler test** - Create a program that just calls sys_read

### Short-term: Implement Missing Syscalls

Priority order:
1. sys_read - Needed for interactive programs and file I/O
2. sys_open - Needed for file operations
3. sys_close - Needed for proper resource cleanup
4. sys_fstat - Needed for file information

### Medium-term: Console I/O

1. Implement console input via SBI (currently only output works)
2. Add getchar_impl() or similar for reading characters
3. Handle line buffering for gets()

### Long-term: Process Management

1. fork() - Create child processes
2. exec() - Execute new programs
3. wait() - Wait for child processes
4. Enable /sh shell and /init

## Debugging Commands

```bash
# Build and run
cd native && make clean && make -j4
cargo build --release --bin geos_native_boot
timeout 10 ./target/release/geos_native_boot

# Check what syscalls are linked
cd native && riscv64-unknown-elf-nm build/geos_native.elf | grep sys_

# Check disassembly around crash address
cd native && riscv64-unknown-elf-objdump -d build/geos_native.elf | grep -A 5 "00000a48"
```

## Files to Check

- `conductor/tracks/xv6-rv32/kernel/sysfile.c` - sys_read, sys_open, sys_close implementations
- `conductor/tracks/xv6-rv32/user/tinycalc.c` - Program that's crashing
- `native/geos_stubs.c` - GeOS syscall forwarding layer
- `native/geos_sys.S` - S-mode trap handler

## Hypothesis

The crash at 0xF787A783 suggests that sys_read is trying to access a file descriptor structure or buffer that wasn't properly initialized. Since we're in interactive mode (argc=1), tinycalloc tries to read from stdin (fd=0), but our console input may not be set up correctly.

The address 0xF787A783 looks like uninitialized memory (high bits set) - could be:
- Uninitialized pointer in file descriptor table
- Corrupted proc->ofile[fd] entry
- NULL pointer dereference

## Testing Plan

1. Create minimal test program that just calls sys_read
2. Add debug prints to sys_read to see what's happening
3. Check if console input is working at all
4. Verify proc->ofile[] is properly initialized