; DESCRIPTION: Draws a purple line from (98, 153) to (230, 130).
; PLAN: r0=98(x1), r1=153(y1), r2=230(x2), r3=130(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 153
LDI r2, 230
LDI r3, 130
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
