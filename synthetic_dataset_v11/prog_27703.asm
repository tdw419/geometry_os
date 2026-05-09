; DESCRIPTION: Renders a purple line between points (185, 41) and (76, 109).
; PLAN: r0=185(x1), r1=41(y1), r2=76(x2), r3=109(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 41
LDI r2, 76
LDI r3, 109
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
