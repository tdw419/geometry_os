; DESCRIPTION: Renders a purple line between points (41, 5) and (156, 13).
; PLAN: r0=41(x1), r1=5(y1), r2=156(x2), r3=13(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 5
LDI r2, 156
LDI r3, 13
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
