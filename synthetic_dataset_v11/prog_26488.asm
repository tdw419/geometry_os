; DESCRIPTION: Places a black line segment connecting (89, 136) to (176, 144).
; PLAN: r0=89(x1), r1=136(y1), r2=176(x2), r3=144(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 136
LDI r2, 176
LDI r3, 144
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
