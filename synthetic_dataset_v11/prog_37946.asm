; DESCRIPTION: Draws a yellow line from (128, 105) to (66, 24).
; PLAN: r0=128(x1), r1=105(y1), r2=66(x2), r3=24(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 105
LDI r2, 66
LDI r3, 24
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
