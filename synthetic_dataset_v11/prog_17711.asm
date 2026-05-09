; DESCRIPTION: Renders a yellow line between points (179, 41) and (155, 26).
; PLAN: r0=179(x1), r1=41(y1), r2=155(x2), r3=26(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 41
LDI r2, 155
LDI r3, 26
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
