# xv6 Native Fork Test - Infinite Loop Issue

## Status

The xv6 native kernel boots successfully and loads `/fork_test` from disk.img, but the user program enters an infinite sret loop at PC `0x000000c2`.

## Root Cause

The trap handler hits a non-syscall trap (not ECALL_U) and does NOT advance `sepc`, causing an infinite loop where the same instruction traps repeatedly.

## Evidence

```
[sret] sepc=0x000000c2 restored_priv=User sstatus=0x000000aa satap=0x80080503
[sret] After: pc=0x000000c2 priv=User sp=0x7fffef80
```

The same PC repeats forever, indicating `sepc` is not being advanced.

## Analysis

The instruction at 0xc2 is:
```assembly
c:  81858593  addi a1,a1,-2024
```

This sets up a string pointer for the first printf. The fact that it traps repeatedly suggests:

1. **Memory access fault** - Trying to read from an unmapped address
2. **Page fault** - The code segment isn't properly mapped in Sv32
3. **Alignment fault** - Shouldn't happen for addi

The most likely cause is **instruction fetch fault** - the code at 0xc2 isn't properly mapped in the Sv32 page tables.

## What's Working

- ✅ Kernel boots successfully
- ✅ Filesystem validation passes
- ✅ `/fork_test` is found and loaded
- ✅ Sv32 page tables are created
- ✅ User-mode entry via `sv32_enter_user` executes
- ✅ Trap handler is invoked
- ✅ sret returns to User-mode

## What's Not Working

- ❌ Non-syscall traps don't advance `sepc`
- ❌ User program stuck in infinite loop
- ❌ Fork test doesn't execute

## Next Steps

### Option 1: Implement Proper Non-Syscall Trap Handling

Modify `stvec_handler` to handle non-syscall traps:

```assembly
non_syscall_trap:
    # Read scause
    csrr t0, scause

    # Check for instruction fetch fault (cause=1)
    li t1, 1
    beq t0, t1, instruction_fetch_fault

    # Check for load access fault (cause=5)
    li t1, 5
    beq t0, t1, load_access_fault

    # Check for store access fault (cause=7)
    li t1, 7
    beq t0, t1, store_access_fault

    # Unknown trap - kill process
    j kill_process

instruction_fetch_fault:
    # Print fault info
    li a7, 0x01  # putchar
    li a0, 'I'
    ecall
    li a0, 'F'
    ecall
    # TODO: Check page tables, kill process, etc.

    # For now, advance sepc to break the loop
    csrr t0, sepc
    addi t0, t0, 4
    csrw sepc, t0
    j stvec_restore

kill_process:
    # Exit the current process
    li a0, 1
    call kexit
```

### Option 2: Debug Page Table Mapping

Add debug output to verify page table mappings:

1. Dump the Sv32 page tables after ELF loading
2. Verify the code segment (0x0-0x1000) is mapped with X permission
3. Verify the data segment is mapped with R/W permissions
4. Check for any unmapped regions

### Option 3: Fix Interpreter Restore Path

The Geometry OS interpreter's `restore_path` may be overwriting state incorrectly. Need to:

1. Not overwrite `sepc` when transitioning from M-mode with `MPP == 2` (sentinel)
2. Use `sscratch` for user stack pointer restoration
3. Set `sp` directly before `mret` for self-contained fix

## Related Files

- `/home/jericho/projects/zion/projects/geometry_os/geometry_os/native/geos_sys.S` - Trap handler (stvec_handler)
- `/home/jericho/projects/zion/projects/geometry_os/geometry_os/native/geos_main.c` - ELF loading and Sv32 mapping
- `/home/jericho/projects/zion/projects/geometry_os/geometry_os/conductor/tracks/xv6-rv32/user/fork_test.c` - Test program

## Temporary Workaround

For now, we can test fork/wait/exit by:

1. Loading `/echo` instead (uses only console I/O, no complex syscalls)
2. Modifying `geos_main.c` to call fork/wait directly from kernel mode
3. Writing a unit test in C that tests fork/wait without requiring full user-mode execution

## Conclusion

The multi-process infrastructure (kfork, kwait, kexit) is implemented and the symbols are present in the kernel. The remaining issue is getting user programs to execute correctly in U-mode with Sv32 page tables. This is a trap handling/page table mapping issue, not a process management issue.