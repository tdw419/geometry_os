; DESCRIPTION: Draw object: pos=the screen, color=red, size=fixed size.

; test_sandbox_init.asm -- Just the init section of particle sandbox
LDI r9, 1
LDI r21, 4
LDI r22, 128
LDI r23, 0x7000
LDI r24, 0x7800
LDI r25, 0x7801
LDI r26, 0x7802
LDI r27, 0x7803

; Build color table (16 entries at 0x7600)
LDI r12, 0x7600
LDI r1, 0x0000FF
STORE r12, r1
ADD r12, r9
LDI r1, 0x00FF00
STORE r12, r1
ADD r12, r9
LDI r1, 0xFF0000
STORE r12, r1

; Init state
LDI r18, 0
STORE r24, r18
LDI r18, 1
STORE r25, r18
STORE r26, r18
STORE r27, r18

; Verify
LDI r12, 0x7600
LOAD r14, r12
ADD r12, r9
LOAD r2, r12
ADD r12, r9
LOAD r13, r12

HALT
