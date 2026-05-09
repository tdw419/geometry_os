; DESCRIPTION: Renders a blue line between points (355, 184) and (225, 148).
; PLAN: r0=355(x1), r1=184(y1), r2=225(x2), r3=148(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 184
LDI r2, 225
LDI r3, 148
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
