; DESCRIPTION: Renders a blue line between points (194, 192) and (302, 81).
; PLAN: r0=194(x1), r1=192(y1), r2=302(x2), r3=81(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 192
LDI r2, 302
LDI r3, 81
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
