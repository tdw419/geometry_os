; DESCRIPTION: Renders a purple line between points (200, 173) and (41, 81).
; PLAN: r0=200(x1), r1=173(y1), r2=41(x2), r3=81(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 173
LDI r2, 41
LDI r3, 81
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
