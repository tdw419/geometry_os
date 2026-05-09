; DESCRIPTION: Draws a purple line from (182, 147) to (161, 11).
; PLAN: r0=182(x1), r1=147(y1), r2=161(x2), r3=11(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 147
LDI r2, 161
LDI r3, 11
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
