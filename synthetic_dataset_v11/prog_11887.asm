; DESCRIPTION: Renders a purple line between points (41, 227) and (64, 157).
; PLAN: r0=41(x1), r1=227(y1), r2=64(x2), r3=157(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 227
LDI r2, 64
LDI r3, 157
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
