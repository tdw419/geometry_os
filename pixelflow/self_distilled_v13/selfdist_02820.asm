; DESCRIPTION: Draws a purple horizontal line across the screen at y=150.
; PLAN: r0(x1), r1=1(y1), r2=15(x2), r3=1(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 1
LDI r2, 15
LDI r3, 1
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
