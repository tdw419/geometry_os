; DESCRIPTION: Renders a blue line between points (232, 43) and (472, 104).
; PLAN: r0=232(x1), r1=43(y1), r2=472(x2), r3=104(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 43
LDI r2, 472
LDI r3, 104
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
