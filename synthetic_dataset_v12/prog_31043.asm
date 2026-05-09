; DESCRIPTION: Draws a purple line from (62, 106) to (6, 220).
; PLAN: r0=62(x1), r1=106(y1), r2=6(x2), r3=220(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 106
LDI r2, 6
LDI r3, 220
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
