; DESCRIPTION: Draws a purple line from (457, 38) to (56, 183).
; PLAN: r0=457(x1), r1=38(y1), r2=56(x2), r3=183(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 38
LDI r2, 56
LDI r3, 183
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
