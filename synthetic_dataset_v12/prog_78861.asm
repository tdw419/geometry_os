; DESCRIPTION: Renders a blue line between points (472, 75) and (296, 22).
; PLAN: r0=472(x1), r1=75(y1), r2=296(x2), r3=22(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 75
LDI r2, 296
LDI r3, 22
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
