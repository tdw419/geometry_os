; DESCRIPTION: Renders a blue line between points (119, 106) and (91, 227).
; PLAN: r0=119(x1), r1=106(y1), r2=91(x2), r3=227(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 106
LDI r2, 91
LDI r3, 227
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
