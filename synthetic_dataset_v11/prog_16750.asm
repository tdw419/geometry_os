; DESCRIPTION: Draws a purple line from (238, 233) to (147, 41).
; PLAN: r0=238(x1), r1=233(y1), r2=147(x2), r3=41(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 233
LDI r2, 147
LDI r3, 41
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
