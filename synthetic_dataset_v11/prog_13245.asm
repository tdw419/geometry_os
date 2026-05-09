; DESCRIPTION: Renders a purple line between points (236, 245) and (41, 80).
; PLAN: r0=236(x1), r1=245(y1), r2=41(x2), r3=80(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 245
LDI r2, 41
LDI r3, 80
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
