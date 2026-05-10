; DESCRIPTION: Draws a purple line from (101, 135) to (378, 130).
; PLAN: r0=101(x1), r1=135(y1), r2=378(x2), r3=130(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 135
LDI r2, 378
LDI r3, 130
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
