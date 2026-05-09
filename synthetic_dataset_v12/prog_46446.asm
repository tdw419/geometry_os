; DESCRIPTION: Renders a purple line between points (104, 41) and (188, 167).
; PLAN: r0=104(x1), r1=41(y1), r2=188(x2), r3=167(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 41
LDI r2, 188
LDI r3, 167
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
