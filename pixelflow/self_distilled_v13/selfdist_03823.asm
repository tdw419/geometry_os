; DESCRIPTION: Draws a purple horizontal line across the screen at y=157.
; PLAN: r0x1), r1=1(y1), r2=15(x2), r3=2(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 1
LDI r2, 15
LDI r3, 2
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
