; DESCRIPTION: Renders a blue line between points (461, 76) and (254, 147).
; PLAN: r0=461(x1), r1=76(y1), r2=254(x2), r3=147(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 76
LDI r2, 254
LDI r3, 147
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
