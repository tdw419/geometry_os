; DESCRIPTION: Draw object: pos=the screen, color=red, size=fixed size.

; test_sandbox_init.asm -- Just the init section of particle sandbox
LDI r3, 1
LDI r21, 4
LDI r22, 128
LDI r23, 0x7000
LDI r24, 0x7800
LDI r25, 0x7801
LDI r26, 0x7802
LDI r27, 0x7803

; Build color table (16 entries at 0x7600)
LDI r0, 0x7600
LDI r1, 0x0000FF
STORE r0, r1
ADD r0, r3
LDI r1, 0x00FF00
STORE r0, r1
ADD r0, r3
LDI r1, 0xFF0000
STORE r0, r1

; Init state
LDI r18, 0
STORE r24, r18
LDI r18, 1
STORE r25, r18
STORE r26, r18
STORE r27, r18

; Verify
LDI r0, 0x7600
LOAD r7, r0
ADD r0, r3
LOAD r10, r0
ADD r0, r3
LOAD r15, r0

HALT
