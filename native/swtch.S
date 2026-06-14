# swtch.S -- RISC-V RV32 context switch for xv6 native port
#
# void swtch(struct context *old, struct context *new);
#
# Save callee-saved registers (ra, sp, s0-s11) to *old,
# restore from *new, and return on the new stack.
#
# Calling convention:
#   a0 = pointer to old context (where to save current regs)
#   a1 = pointer to new context (where to load new regs from)

.section .text
.globl swtch
swtch:
    # ── Save current context to *a0 ─────────────────────────────────
    sw ra,  0(a0)       # return address
    sw sp,  4(a0)       # stack pointer
    sw s0,  8(a0)       # callee-saved registers s0-s11
    sw s1,  12(a0)
    sw s2,  16(a0)
    sw s3,  20(a0)
    sw s4,  24(a0)
    sw s5,  28(a0)
    sw s6,  32(a0)
    sw s7,  36(a0)
    sw s8,  40(a0)
    sw s9,  44(a0)
    sw s10, 48(a0)
    sw s11, 52(a0)

    # ── Restore new context from *a1 ────────────────────────────────
    lw ra,  0(a1)       # return address
    lw sp,  4(a1)       # stack pointer
    lw s0,  8(a1)
    lw s1,  12(a1)
    lw s2,  16(a1)
    lw s3,  20(a1)
    lw s4,  24(a1)
    lw s5,  28(a1)
    lw s6,  32(a1)
    lw s7,  36(a1)
    lw s8,  40(a1)
    lw s9,  44(a1)
    lw s10, 48(a1)
    lw s11, 52(a1)

    ret                 # return (now on new stack)
