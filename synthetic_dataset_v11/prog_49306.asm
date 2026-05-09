; DESCRIPTION: Renders a blue line between points (14, 105) and (204, 181).
; PLAN: r0=14(x1), r1=105(y1), r2=204(x2), r3=181(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 105
LDI r2, 204
LDI r3, 181
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
