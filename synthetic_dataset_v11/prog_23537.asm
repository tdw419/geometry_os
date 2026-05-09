; DESCRIPTION: Places a green line segment connecting (119, 89) to (136, 255).
; PLAN: r0=119(x1), r1=89(y1), r2=136(x2), r3=255(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 89
LDI r2, 136
LDI r3, 255
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
