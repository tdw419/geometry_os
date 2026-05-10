; DESCRIPTION: Renders a blue line between points (142, 210) and (62, 137).
; PLAN: r0=142(x1), r1=210(y1), r2=62(x2), r3=137(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 210
LDI r2, 62
LDI r3, 137
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
