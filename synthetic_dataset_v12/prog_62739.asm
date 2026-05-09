; DESCRIPTION: Renders a purple line between points (432, 102) and (477, 191).
; PLAN: r0=432(x1), r1=102(y1), r2=477(x2), r3=191(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 102
LDI r2, 477
LDI r3, 191
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
