; DESCRIPTION: Renders a blue line segment connecting (17, 105) to (336, 8).
; PLAN: r0=17(x1), r1=105(y1), r2=336(x2), r3=8(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 105
LDI r2, 336
LDI r3, 8
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
