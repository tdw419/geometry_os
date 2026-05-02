; test_sandbox_init.asm -- Just the init section of particle sandbox
LDI r7, 1
LDI r21, 4
LDI r22, 128
LDI r23, 0x7000
LDI r24, 0x7800
LDI r25, 0x7801
LDI r26, 0x7802
LDI r27, 0x7803

; Build color table (16 entries at 0x7600)
LDI r14, 0x7600
LDI r15, 0x0000FF
STORE r14, r15
ADD r14, r7
LDI r15, 0x00FF00
STORE r14, r15
ADD r14, r7
LDI r15, 0xFF0000
STORE r14, r15

; Init state
LDI r18, 0
STORE r24, r18
LDI r18, 1
STORE r25, r18
STORE r26, r18
STORE r27, r18

; Verify
LDI r14, 0x7600
LOAD r1, r14
ADD r14, r7
LOAD r2, r14
ADD r14, r7
LOAD r3, r14

HALT
