    .section .text
    .globl kern_trap_entry
    .align 4
kern_trap_entry:
    /* 1. Atomically get context from mscratch into tp */
    csrrw   tp, mscratch, tp
    
    /* 2. Save Guest Registers (x1, x3-x31, sp, pc) */
    sw      x1, 4(tp)
    sw      x3, 12(tp)
    /* The original tp was in mscratch */
    csrr    t0, mscratch
    sw      t0, 16(tp)
    sw      x5, 20(tp)
    sw      x6, 24(tp)
    sw      x7, 28(tp)
    sw      x8, 32(tp)
    sw      x9, 36(tp)
    sw      x10, 40(tp)
    sw      x11, 44(tp)
    sw      x12, 48(tp)
    sw      x13, 52(tp)
    sw      x14, 56(tp)
    sw      x15, 60(tp)
    sw      x16, 64(tp)
    sw      x17, 68(tp)
    sw      x18, 72(tp)
    sw      x19, 76(tp)
    sw      x20, 80(tp)
    sw      x21, 84(tp)
    sw      x22, 88(tp)
    sw      x23, 92(tp)
    sw      x24, 96(tp)
    sw      x25, 100(tp)
    sw      x26, 104(tp)
    sw      x27, 108(tp)
    sw      x28, 112(tp)
    sw      x29, 116(tp)
    sw      x30, 120(tp)
    sw      x31, 124(tp)
    sw      sp, 8(tp)
    csrr    t0, mepc
    sw      t0, 128(tp)

    /* 3. Cause Analysis */
    csrr    t0, mcause
    li      t1, 0x80000007
    beq     t0, t1, handle_timer
    li      t1, 8
    beq     t0, t1, handle_ecall
    j       panic_trap

handle_timer:
    /* Heartbeat 'T' */
    li      a0, 0x54
    li      a7, 1
    ecall

    /* Reset Timer */
    li      t0, 0x0200bff8
    lw      a0, 0(t0)
    lw      a1, 4(t0)
    li      t1, 500000
    add     a0, a0, t1
    sltu    t2, a0, t1
    add     a1, a1, t2
    li      t0, 0x02004000
    li      t1, 0xFFFFFFFF
    sw      t1, 4(t0)
    sw      a0, 0(t0)
    sw      a1, 4(t0)

    /* Toggle current_id */
    la      t0, current_id
    lw      t1, 0(t0)
    xori    t1, t1, 1
    sw      t1, 0(t0)

    /* Apply clip rect for new program (i.2.2) */
    mv      s11, tp
    jal     ra, kern_apply_clip
    mv      tp, s11

    /* Select context to restore */
    la      t2, contexts
    beqz    t1, switch_0
    addi    tp, t2, 136
    j       restore_context
switch_0:
    mv      tp, t2
    j       restore_context

handle_ecall:
    /* Advance guest PC past ecall */
    lw      t0, 128(tp)
    addi    t0, t0, 4
    sw      t0, 128(tp)
    
    /* Check extension ID in a7 (offset 68) */
    lw      a7, 68(tp)
    li      t1, 0x0ACE0500
    beq     a7, t1, handle_geos_sbi
    
    /* Proxy SBI call to host */
    mv      s11, tp
    lw      a0, 40(tp)
    lw      a1, 44(tp)
    lw      a2, 48(tp)
    lw      a3, 52(tp)
    lw      a4, 56(tp)
    lw      a5, 60(tp)
    lw      a6, 64(tp)
    lw      a7, 68(tp)
    ecall
    mv      tp, s11
    sw      a0, 40(tp)
    sw      a1, 44(tp)
    j       restore_context

handle_geos_sbi:
    /* Jump to C handler in geos_kern.c */
    mv      s11, tp
    lw      a0, 40(tp)
    lw      a1, 44(tp)
    lw      a2, 48(tp)
    lw      a3, 52(tp)
    lw      a4, 56(tp)
    lw      a5, 60(tp)
    lw      a6, 64(tp)
    jal     ra, kern_handle_geos_sbi
    mv      tp, s11
    sw      a0, 40(tp)
    sw      a1, 44(tp)
    j       restore_context

restore_context:
    csrw    mscratch, tp
    lw      t0, 128(tp)
    csrw    mepc, t0
    lw      sp, 8(tp)
    lw      x1, 4(tp)
    lw      x3, 12(tp)
    lw      x5, 20(tp)
    lw      x6, 24(tp)
    lw      x7, 28(tp)
    lw      x8, 32(tp)
    lw      x9, 36(tp)
    lw      x10, 40(tp)
    lw      x11, 44(tp)
    lw      x12, 48(tp)
    lw      x13, 52(tp)
    lw      x14, 56(tp)
    lw      x15, 60(tp)
    lw      x16, 64(tp)
    lw      x17, 68(tp)
    lw      x18, 72(tp)
    lw      x19, 76(tp)
    lw      x20, 80(tp)
    lw      x21, 84(tp)
    lw      x22, 88(tp)
    lw      x23, 92(tp)
    lw      x24, 96(tp)
    lw      x25, 100(tp)
    lw      x26, 104(tp)
    lw      x27, 108(tp)
    lw      x28, 112(tp)
    lw      x29, 116(tp)
    lw      x30, 120(tp)
    lw      x31, 124(tp)
    lw      tp, 16(tp)
    mret

panic_trap:
    li      a7, 8
    ecall
