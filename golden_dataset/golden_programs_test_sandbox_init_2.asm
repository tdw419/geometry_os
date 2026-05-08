; DESCRIPTION: Display a object using color red at the screen.

; test_sandbox_init.asm -- Just the init section of particle sandbox
LDI r12, 1
LDI r21, 4
LDI r22, 128
LDI r23, 0x7000
LDI r24, 0x7800
LDI r25, 0x7801
LDI r26, 0x7802
LDI r27, 0x7803

; Build color table (16 entries at 0x7600)
LDI r10, 0x7600
LDI r0, 0x0000FF
STORE r10, r0
ADD r10, r12
LDI r0, 0x00FF00
STORE r10, r0
ADD r10, r12
LDI r0, 0xFF0000
STORE r10, r0

; Init state
LDI r18, 0
STORE r24, r18
LDI r18, 1
STORE r25, r18
STORE r26, r18
STORE r27, r18

; Verify
LDI r10, 0x7600
LOAD r9, r10
ADD r10, r12
LOAD r6, r10
ADD r10, r12
LOAD r11, r10

HALT
