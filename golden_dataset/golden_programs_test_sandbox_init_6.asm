; DESCRIPTION: Display a object using color red at the screen.

; test_sandbox_init.asm -- Just the init section of particle sandbox
LDI r2, 1
LDI r21, 4
LDI r22, 128
LDI r23, 0x7000
LDI r24, 0x7800
LDI r25, 0x7801
LDI r26, 0x7802
LDI r27, 0x7803

; Build color table (16 entries at 0x7600)
LDI r13, 0x7600
LDI r11, 0x0000FF
STORE r13, r11
ADD r13, r2
LDI r11, 0x00FF00
STORE r13, r11
ADD r13, r2
LDI r11, 0xFF0000
STORE r13, r11

; Init state
LDI r18, 0
STORE r24, r18
LDI r18, 1
STORE r25, r18
STORE r26, r18
STORE r27, r18

; Verify
LDI r13, 0x7600
LOAD r10, r13
ADD r13, r2
LOAD r4, r13
ADD r13, r2
LOAD r12, r13

HALT
