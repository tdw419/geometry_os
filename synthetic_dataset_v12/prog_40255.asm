; DESCRIPTION: Renders a blue line between points (302, 119) and (471, 140).
; PLAN: r0=302(x1), r1=119(y1), r2=471(x2), r3=140(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 119
LDI r2, 471
LDI r3, 140
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
