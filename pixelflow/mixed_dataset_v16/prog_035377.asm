; DESCRIPTION: Draws a white line from (222, 37) to (128, 99).
; PLAN: r0=222(x1), r1=37(y1), r2=128(x2), r3=99(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 37
LDI r2, 128
LDI r3, 99
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
