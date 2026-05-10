; DESCRIPTION: Draws a purple horizontal line across the screen at y=93.
; PLAN: r0=93(x1), r1=93(y1), r2=1(x2), r3=9(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 93
LDI r2, 1
LDI r3, 9
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
