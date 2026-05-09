; DESCRIPTION: Renders a purple line between points (220, 41) and (100, 254).
; PLAN: r0=220(x1), r1=41(y1), r2=100(x2), r3=254(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 41
LDI r2, 100
LDI r3, 254
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
