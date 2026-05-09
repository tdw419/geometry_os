; DESCRIPTION: Renders a purple line between points (432, 251) and (377, 96).
; PLAN: r0=432(x1), r1=251(y1), r2=377(x2), r3=96(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 251
LDI r2, 377
LDI r3, 96
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
