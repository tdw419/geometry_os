; DESCRIPTION: Renders a blue line between points (169, 254) and (155, 106).
; PLAN: r0=169(x1), r1=254(y1), r2=155(x2), r3=106(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 254
LDI r2, 155
LDI r3, 106
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
