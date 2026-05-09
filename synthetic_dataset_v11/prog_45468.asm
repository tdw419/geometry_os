; DESCRIPTION: Places a blue line segment connecting (29, 165) to (155, 184).
; PLAN: r0=29(x1), r1=165(y1), r2=155(x2), r3=184(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 165
LDI r2, 155
LDI r3, 184
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
