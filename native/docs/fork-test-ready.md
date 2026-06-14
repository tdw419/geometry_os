# xv6 Native Fork Test - Ready to Run

## Status Summary

All components for testing fork/wait/exit functionality are in place and ready to execute.

## Implementation Status

### 1. Kernel Multi-Process Functions ✅

All three critical functions are implemented and compiled into geos_native.elf:

```
80000dc2 g     F .text  kfork   (266 bytes)
800007d2 g     F .text  kexit   (130 bytes)
80000854 g     F .text  kwait   (164 bytes)
```

**kfork()** - Creates child process:
- Allocates new process structure via allocproc()
- Copies parent's Sv32 page tables via uvmcopy()
- Copies trapframe (registers)
- Sets child's a0 = 0 (fork returns 0 in child)
- Returns child's PID to parent

**kexit()** - Process termination:
- Stores exit status in process state
- Closes all file descriptors
- Marks process as ZOMBIE
- Wakes parent process
- Yields CPU via sched()

**kwait()** - Reap zombie children:
- Scans process table for children
- Returns -1 if no children exist
- Waits for ZOMBIE state if children exist but none dead yet
- Copies exit status, frees process resources
- Returns child's PID

### 2. User Test Program ✅

Test binary exists: `conductor/tracks/xv6-rv32/user/_fork_test` (23KB)

Expected output from fork_test:
```
Child: running
Parent: forked child pid=%d
Parent: child exited with status=%d
```

### 3. Kernel Configuration ✅

geos_main.c is configured to load `/fork_test`:
```c
printf("\nLoading /fork_test (test fork/wait)...\n");
load_and_run_elf("/fork_test");
```

## How to Test

### Method 1: Using Geometry OS MCP (Preferred)

```bash
# Ensure Geometry OS server is running
# Then use the MCP tool:
mcp_geo_riscv_run(elf_path='native/build/geos_native.elf')
```

### Method 2: Direct Binary Inspection

```bash
# Verify symbols exist
riscv64-unknown-elf-objdump -t native/build/geos_native.elf | grep -E "kfork|kwait|kexit"

# Disassemble the functions
riscv64-unknown-elf-objdump -d native/build/geos_native.elf | grep -A 20 "<kfork>:"
riscv64-unknown-elf-objdump -d native/build/geos_native.elf | grep -A 20 "<kexit>:"
riscv64-unknown-elf-objdump -d native/build/geos_native.elf | grep -A 20 "<kwait>:"
```

### Method 3: Build and Verify Script

```bash
cd native
./test-fork-complete.sh
```

## Expected Test Results

If fork/wait/exit is working correctly, the console output should show:

1. **Parent process starts**
   ```
   forktest: starting
   forktest: parent waiting for child (PID N)
   ```

2. **Child process creates and runs**
   ```
   forktest: child running (PID M)
   forktest: child exiting with status 42
   ```

3. **Parent reaps child**
   ```
   forktest: child exited with status 42
   forktest: parent exiting
   ```

4. **System shuts down cleanly**
   ```
   process exit: 0
   === Shutdown at instr X ===
   ```

## Architecture Notes

### Two Separate xv6 Implementations

1. **`native/`** - Geometry OS native port (THIS ONE)
   - Runs under GeOS RISC-V interpreter
   - Uses GeOS ecall for I/O, memory, disk
   - Includes kfork/kwait/kexit in geos_stubs.c
   - Loads from disk.img (shared with conductor)

2. **`conductor/tracks/xv6-rv32/`** - Standalone xv6
   - Standard xv6 for RISC-V
   - Different build system
   - Separate user programs

The native port borrows user programs from conductor but runs them in its own GeOS environment.

### Multi-Process Implementation Details

**Process Table**: Located in geos_stubs.c (around line 90)
- Fixed size: NPROC processes
- Each proc has: state, pid, pagetable, sz, trapframe, context, files

**State Transitions**:
- USED → RUNNABLE (allocproc → fork)
- RUNNABLE → RUNNING (scheduler)
- RUNNING → ZOMBIE (exit)
- ZOMBIE → UNUSED (wait)

**Scheduler**: Cooperative (no preemptive timer interrupts)
- Uses swtch.S for context switching
- Yielded via sched() after fork, wait, or exit

## Next Steps After Fork Test Passes

Once fork/wait/exit is verified working:

1. **Implement exec()** - Load and execute new programs
2. **Add file I/O syscalls** - open(), close(), read(), write()
3. **Build full shell** - Command parsing and execution
4. **Add pipes** - Inter-process communication
5. **Implement scheduler** - Round-robin scheduling

## Files Modified This Session

- `native/user/forktest.c` - Created (fixed includes and printf calls)
- `native/Makefile.user` - Updated to build forktest
- `native/test-fork-complete.sh` - Created verification script
- `native/test-fork.sh` - Updated documentation

## Verification Checklist

- [x] kfork() compiled and linked
- [x] kexit() compiled and linked
- [x] kwait() compiled and linked
- [x] fork_test binary exists in filesystem
- [x] geos_main.c configured to load /fork_test
- [x] Build system compiles successfully
- [ ] **Runtime test passes** (needs Geometry OS server)

## Debugging Tips

If fork test fails:

1. **Check process table state**
   - Look for "allocproc" or "freeproc" messages
   - Verify NPROC not exhausted

2. **Check page table copy**
   - Look for "uvmcopy" errors
   - Verify parent pagetable is valid

3. **Check trap handling**
   - Verify ECALL_U is being handled
   - Check child's a0 is set to 0

4. **Check scheduler**
   - Verify swtch.S context switching
   - Check for infinite loops

5. **Use diagnostic output**
   - geos_main.c has printf statements for each stage
   - Enable verbose logging in geos_stubs.c if needed

---

Last updated: May 29, 2026
Test ready: YES
Expected runtime: < 5 seconds