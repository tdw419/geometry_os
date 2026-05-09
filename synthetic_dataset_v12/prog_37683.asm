; DESCRIPTION: Renders a purple line between points (73, 183) and (432, 2).
; PLAN: r0=73(x1), r1=183(y1), r2=432(x2), r3=2(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 183
LDI r2, 432
LDI r3, 2
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
