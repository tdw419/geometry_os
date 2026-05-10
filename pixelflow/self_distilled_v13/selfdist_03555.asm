; DESCRIPTION: Draws a purple horizontal line across the screen at y=82.
; PLAN: r0=82(x1), r1=10(y1), r2=0(x2), r3=2(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 10
LDI r2, 0
LDI r3, 2
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
