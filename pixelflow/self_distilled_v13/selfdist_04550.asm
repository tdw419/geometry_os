; DESCRIPTION: Draws a purple horizontal line across the screen at y=100.
; PLAN: r0=10(x1), r1=10(y1), r2=1(x2), r3=11(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 10
LDI r2, 1
LDI r3, 11
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
