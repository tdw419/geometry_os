# geos_sys.S -- Entry point and ecall wrappers for geos_native.elf
#
# Compiles with: riscv64-unknown-elf-gcc -march=rv32imac_zicsr -mabi=ilp32
#
# The GeOS RISC-V interpreter handles all ecalls via sbi::handle_ecall().
# Our ecall numbers:
#   0x01  = SBI_CONSOLE_PUTCHAR  (legacy, a0 = character)
#   0x100 = MALLOC               (a0 = size, returns address in a0)
#   0x101 = FREE                 (a0 = address)
#   0x200 = DISK_READ            (a0 = blockno, a1 = buffer)
#   0x201 = DISK_WRITE           (a0 = blockno, a1 = buffer)
#   8     = SHUTDOWN

.section .text
.global _entry
_entry:
    # Set up stack: 16KB at _stack_top (defined in linker script)
    la sp, _stack_top
    li t0, 0x4000   # extra 16KB margin
    sub sp, sp, t0

    # Zero BSS
    la t0, _bss_start
    la t1, _bss_end
    bgeu t0, t1, bss_done
bss_loop:
    sw zero, 0(t0)
    addi t0, t0, 4
    bltu t0, t1, bss_loop
bss_done:

    # Set thread pointer (hart 0)
    li tp, 0

    # Jump to C main
    call geos_main

    # Shouldn't return, but if it does, shutdown
    li a7, 8
    ecall
1:  j 1b

# ── Ecall wrapper macros ──────────────────────────────────────────────

# putchar(ch) -- write a single character to console (SBI legacy)
.global putchar
putchar:
    li a7, 0x01       # SBI_CONSOLE_PUTCHAR
    ecall
    ret

# getchar() -> int -- read one character from console (SBI v0.1 legacy)
# Returns: character (0-255) or -1 (0xFFFFFFFF) if no input available
.global getchar_impl
getchar_impl:
    li a7, 0x02       # SBI_CONSOLE_GETCHAR
    ecall
    ret

# kalloc_impl() -> void* -- allocate a 4096-byte page via ecall 0x100
.global kalloc_impl
kalloc_impl:
    li a7, 0x100      # MALLOC
    ecall
    ret

# kfree_impl(void* addr) -- free a page via ecall 0x101
.global kfree_impl
kfree_impl:
    li a7, 0x101      # FREE
    ecall
    ret

# disk_read_impl(uint blockno, void* buf) -- read 512-byte block via ecall 0x200
.global disk_read_impl
disk_read_impl:
    li a7, 0x200      # DISK_READ
    ecall
    ret

# disk_write_impl(uint blockno, void* buf) -- write 512-byte block via ecall 0x201
.global disk_write_impl
disk_write_impl:
    li a7, 0x201      # DISK_WRITE
    ecall
    ret

# shutdown() -- halt the emulator
.global shutdown
shutdown:
    li a7, 8          # Legacy SBI shutdown
    ecall
1:  j 1b

# exec_elf(uint entry) -- jump to a loaded ELF with user-mode register setup
#   a0 = entry point address
# Sets sp to user stack top, a0=0 (argc), a1=0 (argv), then jumps to entry.
# ── User code entry (with Sv32 enabled) ────────────────────────────────
#
# Takes two arguments:
#   a0: entry point (physical address)
#   a1: root page table physical address (for SATP)
#
# Enables Sv32 translation then jumps to user code.

# ── M-mode to U-mode privilege escalation for Sv32 ─────────────────────
#
# The shell ELF is linked at VA 0x0, so Sv32 translation must be enabled.
# SATP cannot be written from M-mode, so we escalate: M -> S -> U.
#
# Steps:
#   1. exec_elf (M-mode) sets MPP=01, mepc=exec_elf_smode_trampoline
#   2. mret drops to S-mode at exec_elf_smode_trampoline
#   3. Trampoline (S-mode) writes SATP, sets up stvec, sret -> U-mode
#   4. Shell runs at VA 0x0 with Sv32 enabled

.global exec_elf
exec_elf:
    # Save arguments in callee-saved registers for S-mode trampoline
    mv s0, a0         # s0 = entry point
    mv s1, a1         # s1 = root page table PA

    # Debug marker 0 - prints '0' at entry
    li a7, 0x01
    li a0, 48   # '0' character
    ecall

    # Set up M-mode state for S-mode trap delegation
    # medeleg[8]=1 so ECALL_U from U-mode goes to S-mode stvec
    li t0, 0x100         # bit 8 = ECALL_U delegation
    csrw medeleg, t0

    # Set stvec for S-mode trap handling (will be active after mret)
    la t0, stvec_handler
    csrw stvec, t0
    csrw sie, zero

    # Set up sscratch with kernel stack pointer for trap handler
    la t0, _stack_top
    csrw sscratch, t0

    # Step 1: Set mstatus.MPP=01 (Supervisor), mstatus.MPIE=1
    # MPP is bits 12:11, so MPP=01 means bit 11 = 1, bit 12 = 0
    li t0, (1 << 11) | (1 << 7)   # MPP=01 (S-mode), MPIE=1
    csrw mstatus, t0

    # Step 2: Set mepc to S-mode trampoline
    # Workaround for broken la expansion - use lui + addi with immediate offset
    # The offset from auipc to trampoline is 0x18 (will be adjusted by linker)
    auipc t0, 0
    addi t0, t0, 24    # 24 = 0x18, offset to exec_elf_smode_trampoline
    csrw mepc, t0

    # Debug marker 1 - prints '1' before mret
    li a7, 0x01
    li a0, 49   # '1' character
    ecall

    # Step 3: Drop to S-mode via mret
    mret
    # Never returns

# ── S-mode trampoline: enable Sv32, then drop to U-mode ─────────────────
#
# Entered via mret from M-mode. Privilege is now S-mode, so SATP can be written.
# Sets up Sv32 page tables and stvec, then srets to user code.
#
# On entry:
#   s0 = user entry point (VA 0x0)
#   s1 = root page table PA
#   We are in S-mode, can write SATP

.balign 4
.global exec_elf_smode_trampoline
exec_elf_smode_trampoline:
    # Debug marker 2 - prints '2' in S-mode
    li a7, 0x01
    li a0, 50   # '2' character
    ecall

    # Step 1: Set up SATP for Sv32: MODE=1 (bit 31), ASID=0, PPN=root_pa >> 12
    li t0, 0x80000000  # Sv32 mode bit in position 31
    srli t1, s1, 12    # Get PPN from root page table PA
    or t0, t0, t1      # Combine MODE bit with PPN
    csrw satp, t0     # Enable Sv32 (allowed in S-mode!)
    sfence.vma        # Flush TLB

    # Debug marker 3 - prints '3' after SATP write
    li a7, 0x01
    li a0, 51   # '3' character
    ecall

    # Debug: print s0 value to see what entry point we have
    li a7, 0x01
    mv a0, s0    # This will print the low byte of s0 (ASCII)
    ecall

    # Step 2: Configure sstatus for U-mode return via sret
    # SPP[8] = 0 (User), SPIE[5] = 1, SIE[1] = 0
    li t0, (1 << 5)   # SPP=0, SPIE=1
    csrw sstatus, t0

    # Step 4: Set sepc to user entry point
    # Debug: print low byte of s0 to see what entry point we have
    li a7, 0x01
    mv a0, s0    # Print low byte of s0
    ecall

    mv t0, s0
    csrw sepc, t0

    # Step 5: Set up user registers
    li sp, 0x7FFFF000  # user stack top (VA)
    li a0, 0           # argc = 0
    li a1, 0           # argv = 0

    # Debug marker 4 - prints '4' before sret
    li a7, 0x01
    li a0, 52   # '4' character
    ecall

    # Step 6: Drop to U-mode via sret
    sret
    # Never returns

# ── S-mode trap handler for xv6 syscalls ────────────────────────────
#
# This is installed as stvec when we drop to U-mode. It handles ecalls
# delegated from U-mode via medeleg[8]=1.
#
# Uses a dedicated kernel stack (not the user stack) to avoid SUM issues.
#
# On entry (ecall from U-mode, delegated to S-mode):
#   sepc = address of ecall instruction
#   scause = 8 (ECALL_U)
#   a7 = syscall number (xv6 convention)
#   a0-a5 = syscall arguments
#
# Registers saved on kernel stack: a0-a7, t0-t6, s0-s1, ra

.balign 4
.global kernelvec
kernelvec:
    # We are already on the kernel stack.
    # Save a few registers that we might use
    addi sp, sp, -64
    sw ra, 0(sp)
    sw t0, 4(sp)
    sw t1, 8(sp)

    # For now, just ignore S-mode traps and return via sret
    lw ra, 0(sp)
    lw t0, 4(sp)
    lw t1, 8(sp)
    addi sp, sp, 64
    sret

.balign 4
.global stvec_handler
stvec_handler:
    # Swap user sp with kernel sp (currently in sscratch)
    csrrw sp, sscratch, sp    # sp = kernel stack pointer, sscratch = user sp

    # Allocate stack frame (144 bytes)
    addi sp, sp, -144

    # Save t0 (untouched) to its slot (12(sp))
    sw t0, 12(sp)

    # Save user sp (from sscratch) to its slot (120(sp))
    csrr t0, sscratch
    sw t0, 120(sp)

    # Save kernel sp (sp + 144) to its slot (124(sp))
    addi t0, sp, 144
    sw t0, 124(sp)

    # Save sepc CSR to stack (128(sp))
    csrr t0, sepc
    sw t0, 128(sp)

    # Save sstatus CSR to stack (132(sp))
    csrr t0, sstatus
    sw t0, 132(sp)

    # Set stvec to kernelvec for S-mode traps while executing syscalls
    la t0, kernelvec
    csrw stvec, t0

    # Save all other GPRs
    sw ra,  0(sp)
    sw gp,  4(sp)
    sw tp,  8(sp)
    # (t0 is already saved at 12(sp))
    sw t1,  16(sp)
    sw t2,  20(sp)
    sw s0,  24(sp)
    sw s1,  28(sp)
    sw a0,  32(sp)
    sw a1,  36(sp)
    sw a2,  40(sp)
    sw a3,  44(sp)
    sw a4,  48(sp)
    sw a5,  52(sp)
    sw a6,  56(sp)
    sw a7,  60(sp)
    sw s2,  64(sp)
    sw s3,  68(sp)
    sw s4,  72(sp)
    sw s5,  76(sp)
    sw s6,  80(sp)
    sw s7,  84(sp)
    sw s8,  88(sp)
    sw s9,  92(sp)
    sw s10, 96(sp)
    sw s11, 100(sp)
    sw t3,  104(sp)
    sw t4,  108(sp)
    sw t5,  112(sp)
    sw t6,  116(sp)

    # Enable SUM (bit 18) of sstatus to allow S-mode to access User memory pages
    csrr t1, sstatus
    li t0, (1 << 18)
    or t1, t1, t0
    csrw sstatus, t1

    # Check trap cause - only handle ECALL_U (cause=8)
    csrr t0, scause
    li t1, 8
    bne t0, t1, non_syscall_trap

    # This is a syscall - call C handler
    # Call C handler: handle_syscall(uint32 *regs, a7, a0, a1, a2, a3, a4, a5)
    mv a0, sp         # regs pointer
    lw a1, 60(sp)     # syscall number from a7 (at 60(sp))
    lw a2, 32(sp)     # arg0 from a0 (at 32(sp))
    lw a3, 36(sp)     # arg1 from a1 (at 36(sp))
    lw a4, 40(sp)     # arg2 from a2 (at 40(sp))
    lw a5, 44(sp)     # arg3 from a3 (at 44(sp))
    lw a6, 48(sp)     # arg4 from a4 (at 48(sp))
    lw a7, 52(sp)     # arg5 from a5 (at 52(sp))
    call handle_syscall

    # Advance the saved sepc (at 128(sp)) past the ecall instruction (4 bytes)
    lw t0, 128(sp)
    addi t0, t0, 4
    sw t0, 128(sp)
    j stvec_restore

non_syscall_trap:
    csrr a0, scause
    lw a1, 128(sp)    # saved sepc
    call handle_non_syscall_trap

    # Read scause
    csrr t0, scause
    bltz t0, is_interrupt    # if it's an interrupt, don't advance sepc

    # Otherwise it's an exception, advance saved sepc by 4 to skip the faulting instruction
    lw t0, 128(sp)
    addi t0, t0, 4
    sw t0, 128(sp)

is_interrupt:
    # Jump to restore and return
    j stvec_restore

.global child_trampoline
child_trampoline:
    li a0, 0
.global stvec_restore
stvec_restore:
    # Save the return value (in a0) to the stack slot for a0 (32(sp))
    sw a0, 32(sp)

    # Set stvec back to stvec_handler for U-mode traps
    la t0, stvec_handler
    csrw stvec, t0

    # Restore sepc from stack (128(sp))
    lw t0, 128(sp)
    csrw sepc, t0

    # Restore sstatus from stack (132(sp))
    lw t0, 132(sp)
    csrw sstatus, t0

    # Load kernel sp (from 124(sp)) and save to sscratch
    lw t0, 124(sp)
    csrw sscratch, t0

    # Restore all GPRs (including t0, except a0, sp)
    lw ra,  0(sp)
    lw gp,  4(sp)
    lw tp,  8(sp)
    lw t0,  12(sp)
    lw t1,  16(sp)
    lw t2,  20(sp)
    lw s0,  24(sp)
    lw s1,  28(sp)
    lw a0,  32(sp)
    lw a1,  36(sp)
    lw a2,  40(sp)
    lw a3,  44(sp)
    lw a4,  48(sp)
    lw a5,  52(sp)
    lw a6,  56(sp)
    lw a7,  60(sp)
    lw s2,  64(sp)
    lw s3,  68(sp)
    lw s4,  72(sp)
    lw s5,  76(sp)
    lw s6,  80(sp)
    lw s7,  84(sp)
    lw s8,  88(sp)
    lw s9,  92(sp)
    lw s10, 96(sp)
    lw s11, 100(sp)
    lw t3,  104(sp)
    lw t4,  108(sp)
    lw t5,  112(sp)
    lw t6,  116(sp)

    # Restore user sp (from 120(sp)), which pops the kernel stack
    lw sp, 120(sp)
    sret

# ── Sv32 activation: drop to User-mode with page tables ──────────────
#
# void sv32_enter_user(uint entry, uint root_page_table_pa)
#   a0 = user entry point (e.g., 0x870, will be translated via Sv32)
#   a1 = physical address of root page table
#
# Sets up satp, stvec, medeleg, and mstatus for U-mode, then mrets.
# U-mode ecalls with medeleg[8]=1 delegate to stvec (our handler).
# After mret, the CPU is in User-mode with Sv32-enabled page tables.

.balign 4
.global sv32_enter_user
sv32_enter_user:
    mv t0, a0           # save entry point
    mv t1, a1           # save root page table physical address

    # Set up S-mode trap handler (stvec) — handles delegated U-mode ecalls
    la t2, stvec_handler
    csrw stvec, t2
    csrw sie, zero

    # Delegate ECALL_U (cause 8) to S-mode: set medeleg bit 8
    # This skips the interpreter's Linux syscall intercept for U-mode ecalls
    # and routes them through the trap mechanism → stvec.
    li t2, 0x100         # bit 8 = ECALL_U delegation
    csrw medeleg, t2

    # Set up sscratch to hold the kernel stack top (_stack_top)
    la t2, _stack_top
    csrw sscratch, t2

    # Set up stack for user mode
    li sp, 0x7FFFF000

    # Set up page tables: satp = (1 << 31) | (root_ppn)
    srli t3, t1, 12
    li t4, 0x80000000   # SV32 mode bit
    or t5, t4, t3
    csrw satp, t5

    # Flush TLB
    sfence.vma

    # Set up sscratch with user stack top for the interpreter's restore_path
    li t2, 0x7FFFF000
    csrw sscratch, t2

    # Set up mstatus for U-mode transition on mret:
    #   MPP = 0 (User mode)
    #   MPIE = 1 (enable interrupts after mret)
    #   SUM = 1 (S-mode trap handler can access U-mode pages, bit 18)
    csrr t6, mstatus
    # Clear MPP (bits 12-11) and SUM (bit 18 = 0x00040000)
    li t2, 0x00041A00
    not t2, t2
    and t6, t6, t2
    # MPP = 0 (User mode) — bits 12-11 = 00, already cleared by mask
    li t2, 0x00040000    # set SUM = 1 (bit 18)
    or  t6, t6, t2
    li t2, 0x00000080    # set MPIE = 1
    or  t6, t6, t2
    csrw mstatus, t6

    # Set mepc to user entry point (must be set before sepc to avoid interpreter overwrite)
    csrw mepc, t0

    # Also set up a0/a1 for the user program (argc=0, argv=0)
    li a0, 0
    li a1, 0

    # Set sp (x2) to the user stack top before mret (self-contained; overrides any interpreter restore)
    li sp, 0x7FFFF000

    # Set sepc from mepc right before mret so the interpreter reads the intended PC
    csrw sepc, t0

    # Jump to user code via mret: this drops to User-mode with Sv32 enabled
    # Ecalls from U-mode go through trap delegation → stvec
    mret

    # Should never reach here
1:  j 1b

# ── sret_to_user(trapframe) ──────────────────────────────────────────
# Restore all user registers from a trapframe and sret to user-space.
# Argument: a0 = pointer to struct trapframe
# This is the child process entry path after fork: the child starts here
# via swtch(), restores user state, and srets to user code with a0=0.
.global sret_to_user
sret_to_user:
    # Set up S-mode trap handler (stvec) for child process U-mode traps
    la t0, stvec_handler
    csrw stvec, t0

    # Load all GPRs from trapframe, ending with sp and a0, then sret
    # Real RV32 struct trapframe offsets:
    # epc=12, ra=20, sp=24, gp=28, tp=32, t0=36, t1=40, t2=44
    # s0=48, s1=52, a0=56, a1=60, a2=64, a3=68, a4=72, a5=76, a6=80, a7=84
    # s2=88, s3=92, s4=96, s5=100, s6=104, s7=108, s8=112, s9=116, s10=120, s11=124
    # t3=128, t4=132, t5=136, t6=140
    
    # First, load epc into t0 and set sepc (advance by 4 to skip ecall)
    lw t0, 12(a0)       # epc
    addi t0, t0, 4      # skip past ecall instruction
    csrw sepc, t0

    # Set sscratch to the child's kernel stack pointer (kernel_sp is at offset 4 of trapframe)
    lw t0, 4(a0)
    csrw sscratch, t0

    # Configure sstatus for U-mode return (SPP=0, SPIE=1, SUM=1)
    li t0, (1 << 18) | (1 << 5)
    csrw sstatus, t0

    # Load ra, gp, tp
    lw ra, 20(a0)
    lw gp, 28(a0)
    lw tp, 32(a0)
    
    # Load t1 through t6, and all saved registers
    lw t1, 40(a0)
    lw t2, 44(a0)
    lw s0, 48(a0)
    lw s1, 52(a0)
    lw a1, 60(a0)
    lw a2, 64(a0)
    lw a3, 68(a0)
    lw a4, 72(a0)
    lw a5, 76(a0)
    lw a6, 80(a0)
    lw a7, 84(a0)
    lw s2, 88(a0)
    lw s3, 92(a0)
    lw s4, 96(a0)
    lw s5, 100(a0)
    lw s6, 104(a0)
    lw s7, 108(a0)
    lw s8, 112(a0)
    lw s9, 116(a0)
    lw s10, 120(a0)
    lw s11, 124(a0)
    lw t3, 128(a0)
    lw t4, 132(a0)
    lw t5, 136(a0)
    lw t6, 140(a0)
    
    # Reload t0 from trapframe
    lw t0, 36(a0)
    
    # Load sp (24)
    lw sp, 24(a0)
    
    # Load a0 last (56) (overwrites base register pointer)
    lw a0, 56(a0)
    
    sret
