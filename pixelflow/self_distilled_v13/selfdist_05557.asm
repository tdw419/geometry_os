; DESCRIPTION: Draws a purple horizontal line across the screen at y=63.
; PLAN: r0=63(x1), r1=0(y1), r2=1(x2), r3=1(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 0
LDI r2, 1
LDI r3, 1
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
