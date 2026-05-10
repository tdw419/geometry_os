; DESCRIPTION: Draws a purple horizontal line across the screen at y=22.
; PLAN: r0=22(x1), r1=1(y1), r2=22(x2), r3=9(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 1
LDI r2, 22
LDI r3, 9
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
