; DESCRIPTION: Draws a purple line from (155, 81) to (507, 58).
; PLAN: r0=155(x1), r1=81(y1), r2=507(x2), r3=58(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 81
LDI r2, 507
LDI r3, 58
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
