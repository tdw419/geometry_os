; DESCRIPTION: Draws a purple horizontal line across the screen at y=45.
; PLAN: r0=45(x1), r1=10(y1), r2=35(x2), r3=6(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 10
LDI r2, 35
LDI r3, 6
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
