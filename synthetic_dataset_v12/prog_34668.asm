; DESCRIPTION: Draws a purple line from (61, 147) to (153, 88).
; PLAN: r0=61(x1), r1=147(y1), r2=153(x2), r3=88(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 147
LDI r2, 153
LDI r3, 88
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
