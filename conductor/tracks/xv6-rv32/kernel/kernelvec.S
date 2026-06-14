        #
        # interrupts and exceptions while in supervisor
        # mode come here.
        #
        # the current stack is a kernel stack.
        # push registers, call kerneltrap().
        # when kerneltrap() returns, restore registers, return.
        #
        # RV32: 32 registers * 4 bytes = 128 bytes
        # Layout: ra=0, sp=4(skip), gp=8, tp=12(skip),
        #   t0=16, t1=20, t2=24,
        #   a0=36, a1=40, a2=44, a3=48, a4=52, a5=56, a6=60, a7=64,
        #   t3=108, t4=112, t5=116, t6=120
        # (offsets halved from RV64 to match 32-bit register width)
        #
.globl kerneltrap
.globl kernelvec
.align 4
kernelvec:
        # make room to save registers.
        addi sp, sp, -128

        # save caller-saved registers.
        sw ra, 0(sp)
        # sw sp, 4(sp)
        sw gp, 8(sp)
        # sw tp, 12(sp)
        sw t0, 16(sp)
        sw t1, 20(sp)
        sw t2, 24(sp)
        sw a0, 36(sp)
        sw a1, 40(sp)
        sw a2, 44(sp)
        sw a3, 48(sp)
        sw a4, 52(sp)
        sw a5, 56(sp)
        sw a6, 60(sp)
        sw a7, 64(sp)
        sw t3, 108(sp)
        sw t4, 112(sp)
        sw t5, 116(sp)
        sw t6, 120(sp)

        # call the C trap handler in trap.c
        call kerneltrap

        # restore registers.
        lw ra, 0(sp)
        # lw sp, 4(sp)
        lw gp, 8(sp)
        # not tp (contains hartid), in case we moved CPUs
        lw t0, 16(sp)
        lw t1, 20(sp)
        lw t2, 24(sp)
        lw a0, 36(sp)
        lw a1, 40(sp)
        lw a2, 44(sp)
        lw a3, 48(sp)
        lw a4, 52(sp)
        lw a5, 56(sp)
        lw a6, 60(sp)
        lw a7, 64(sp)
        lw t3, 108(sp)
        lw t4, 112(sp)
        lw t5, 116(sp)
        lw t6, 120(sp)

        addi sp, sp, 128

        # return to whatever we were doing in the kernel.
        sret
