; DESCRIPTION: Renders a purple line between points (253, 159) and (41, 7).
; PLAN: r0=253(x1), r1=159(y1), r2=41(x2), r3=7(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 159
LDI r2, 41
LDI r3, 7
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
