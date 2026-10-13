.global _start
_start:
    # 1. Setup minimal stack (arbitrary address that won't conflict)
    li sp, 0x80010000
    
    # 2. Do some recognizable computation
    li a0, 0x1111
    li a1, 0x2222
    add a2, a0, a1   # a2 should be 0x3333
    
    # 3. Simulate a memory-mapped UART write (e.g., at 0x10000000)
    li t0, 0x10000000
    sw a2, 0(t0)     # write 0x3333 to 0x10000000
    
    # 4. Trigger an ECALL to signal completion/status to hypervisor
    li a7, 0x99      # arbitrary hypercall ID for "kernel boot success"
    mv a0, a2        # pass our computed value as argument
    ecall
    
    # 5. Infinite loop to prevent running off the end
1:
    j 1b
