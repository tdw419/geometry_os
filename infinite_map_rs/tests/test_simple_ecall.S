/* Simple ecall test - make ecall with syscall 64 (sys_write) */

.section .text
.globl _start

_start:
    li a7, 64                        /* SYS_WRITE */
    li a0, 1                         /* fd = 1 (stdout) */
    li a1, 0x3000                    /* buf = 0x3000 */
    li a2, 4                         /* count = 4 */
    ecall

    /* Write success flag to 0x3000 */
    lui t0, 0x30000
    li t1, 1
    sw t1, 0(t0)

halt:
    j halt