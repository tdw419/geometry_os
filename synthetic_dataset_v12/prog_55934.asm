; DESCRIPTION: Draws a purple line from (200, 119) to (414, 102).
; PLAN: r0=200(x1), r1=119(y1), r2=414(x2), r3=102(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 119
LDI r2, 414
LDI r3, 102
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
