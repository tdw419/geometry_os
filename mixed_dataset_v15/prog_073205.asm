; DESCRIPTION: Renders a blue line segment connecting (220, 155) to (55, 89).
; PLAN: r0=220(x1), r1=155(y1), r2=55(x2), r3=89(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 155
LDI r2, 55
LDI r3, 89
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
