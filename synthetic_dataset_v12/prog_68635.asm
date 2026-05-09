; DESCRIPTION: Renders a blue line between points (29, 163) and (133, 130).
; PLAN: r0=29(x1), r1=163(y1), r2=133(x2), r3=130(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 163
LDI r2, 133
LDI r3, 130
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
