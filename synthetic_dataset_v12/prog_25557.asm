; DESCRIPTION: Renders a blue line between points (129, 199) and (8, 65).
; PLAN: r0=129(x1), r1=199(y1), r2=8(x2), r3=65(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 199
LDI r2, 8
LDI r3, 65
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
