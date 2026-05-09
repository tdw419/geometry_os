; DESCRIPTION: Renders a blue line between points (136, 65) and (99, 35).
; PLAN: r0=136(x1), r1=65(y1), r2=99(x2), r3=35(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 65
LDI r2, 99
LDI r3, 35
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
