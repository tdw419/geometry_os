; DESCRIPTION: Draws a purple line from (6, 36) to (147, 233).
; PLAN: r0=6(x1), r1=36(y1), r2=147(x2), r3=233(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 36
LDI r2, 147
LDI r3, 233
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
