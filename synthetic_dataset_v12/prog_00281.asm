; DESCRIPTION: Renders a blue line between points (461, 159) and (314, 30).
; PLAN: r0=461(x1), r1=159(y1), r2=314(x2), r3=30(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 159
LDI r2, 314
LDI r3, 30
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
