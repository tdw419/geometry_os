; DESCRIPTION: Renders a purple line between points (147, 141) and (41, 189).
; PLAN: r0=147(x1), r1=141(y1), r2=41(x2), r3=189(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 141
LDI r2, 41
LDI r3, 189
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
