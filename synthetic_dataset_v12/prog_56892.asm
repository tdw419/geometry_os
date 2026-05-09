; DESCRIPTION: Renders a blue line between points (89, 16) and (136, 31).
; PLAN: r0=89(x1), r1=16(y1), r2=136(x2), r3=31(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 16
LDI r2, 136
LDI r3, 31
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
