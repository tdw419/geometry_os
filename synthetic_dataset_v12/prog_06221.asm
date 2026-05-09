; DESCRIPTION: Renders a black line between points (76, 106) and (155, 122).
; PLAN: r0=76(x1), r1=106(y1), r2=155(x2), r3=122(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 106
LDI r2, 155
LDI r3, 122
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
