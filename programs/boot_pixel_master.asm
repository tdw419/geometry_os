; boot_pixel_master.asm -- Master Boot Loader (MBL)
; Loaded at 0x1000 by ChainBoot

main:
    ; 1. Initialize Driver Table Count
    LDI r29, 0x7000
    LDI r28, 0
    STORE r29, r28

    ; 2. "Probe" and initialize drivers
    ; In a real system, we'd have a list of addresses from the manifest.
    ; For this demo, we assume drivers are loaded at 0x2000, 0x3000...
    
    ; Load Driver 1 (Screen) at 0x2000
    LDI r1, 0x2000
    LDI r2, call_driver
    ADDI r2, 1
    STORE r2, r1
call_driver:
    CALL 0

    ; 3. Jump to Kernel at 0x3000
    LDI r1, 0x3000
    LDI r2, jump_kernel
    ADDI r2, 1
    STORE r2, r1
jump_kernel:
    JMP 0
