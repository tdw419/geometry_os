; DESCRIPTION: Renders a green line between points (136, 89) and (232, 22).
; PLAN: r0=136(x1), r1=89(y1), r2=232(x2), r3=22(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 89
LDI r2, 232
LDI r3, 22
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
