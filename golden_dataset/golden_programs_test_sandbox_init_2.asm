; DESCRIPTION: This GeOS assembly code initializes a sandbox environment for particle simulations by setting up a color table at memory address 0x7600 with three colors (blue, green, red) and initializing state variables at addresses 0x7800 to 0x7803. It then verifies the setup by loading values from the color table into registers.

; test_sandbox_init.asm -- Just the init section of particle sandbox
LDI r6, 1
LDI r21, 4
LDI r22, 128
LDI r23, 0x7000
LDI r24, 0x7800
LDI r25, 0x7801
LDI r26, 0x7802
LDI r27, 0x7803

; Build color table (16 entries at 0x7600)
LDI r5, 0x7600
LDI r8, 0x0000FF
STORE r5, r8
ADD r5, r6
LDI r8, 0x00FF00
STORE r5, r8
ADD r5, r6
LDI r8, 0xFF0000
STORE r5, r8

; Init state
LDI r18, 0
STORE r24, r18
LDI r18, 1
STORE r25, r18
STORE r26, r18
STORE r27, r18

; Verify
LDI r5, 0x7600
LOAD r3, r5
ADD r5, r6
LOAD r13, r5
ADD r5, r6
LOAD r10, r5

HALT
