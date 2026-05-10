; DESCRIPTION: Renders a blue line between points (314, 17) and (155, 95).
; PLAN: r0=314(x1), r1=17(y1), r2=155(x2), r3=95(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 17
LDI r2, 155
LDI r3, 95
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
