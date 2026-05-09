; DESCRIPTION: Places a blue line segment connecting (204, 155) to (336, 49).
; PLAN: r0=204(x1), r1=155(y1), r2=336(x2), r3=49(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 155
LDI r2, 336
LDI r3, 49
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
