; DESCRIPTION: Renders a yellow line between points (462, 199) and (194, 41).
; PLAN: r0=462(x1), r1=199(y1), r2=194(x2), r3=41(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 199
LDI r2, 194
LDI r3, 41
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
