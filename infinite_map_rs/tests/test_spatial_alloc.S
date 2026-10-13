# RISC-V test for spatial_alloc_region hypercall
# syscall 291 = spatial_alloc_region

# Request at 0x2000, Response at 0x2010

.section .data
    # 0x2000: SpatialAllocReq
    # req_id = 0x0
    .word 0x0
    # width = 10 cells
    .word 0xA
    # height = 5 cells
    .word 0x5

.section .text
    .globl _start

_start:
    # Load syscall arguments
    # a0 = req_ptr = 0x2000
    li a0, 0x2000
    # a1 = resp_ptr = 0x2010
    li a1, 0x2010
    # a7 = syscall number = 291 (0x123)
    li a7, 291

    # ECALL
    ecall

    # Check result (should be in resp at 0x2010)
    # For now, just halt
    li a7, 93      # sys_exit
    li a0, 0       # exit code 0
    ecall

    # Success marker (write to 0x3000 if we get here)
    li t0, 0x3000
    sw t1, 0(t0)   # Write success flag