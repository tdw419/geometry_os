; DESCRIPTION: Draws a purple horizontal line across the screen at y=48.
; PLAN: r0=48(x1), r1=10(y1), r2=28(x2), r3=9(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 10
LDI r2, 28
LDI r3, 9
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
