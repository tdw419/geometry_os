; DESCRIPTION: Draws a purple line from (163, 102) to (13, 159).
; PLAN: r0=163(x1), r1=102(y1), r2=13(x2), r3=159(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 102
LDI r2, 13
LDI r3, 159
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
