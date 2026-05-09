; DESCRIPTION: Draws a purple line from (62, 134) to (30, 4).
; PLAN: r0=62(x1), r1=134(y1), r2=30(x2), r3=4(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 134
LDI r2, 30
LDI r3, 4
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
