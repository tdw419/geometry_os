; DESCRIPTION: Draws a yellow line from (469, 28) to (480, 105).
; PLAN: r0=469(x1), r1=28(y1), r2=480(x2), r3=105(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 28
LDI r2, 480
LDI r3, 105
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
