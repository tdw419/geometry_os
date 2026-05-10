; DESCRIPTION: Renders a green line segment connecting (89, 184) to (236, 35).
; PLAN: r0=89(x1), r1=184(y1), r2=236(x2), r3=35(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 184
LDI r2, 236
LDI r3, 35
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
