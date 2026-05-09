; DESCRIPTION: Renders a blue line between points (136, 156) and (462, 40).
; PLAN: r0=136(x1), r1=156(y1), r2=462(x2), r3=40(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 156
LDI r2, 462
LDI r3, 40
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
