; DESCRIPTION: Draws a purple line from (147, 104) to (33, 105).
; PLAN: r0=147(x1), r1=104(y1), r2=33(x2), r3=105(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 104
LDI r2, 33
LDI r3, 105
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
