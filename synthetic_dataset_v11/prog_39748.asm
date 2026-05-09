; DESCRIPTION: Renders a blue line between points (169, 84) and (137, 155).
; PLAN: r0=169(x1), r1=84(y1), r2=137(x2), r3=155(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 84
LDI r2, 137
LDI r3, 155
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
