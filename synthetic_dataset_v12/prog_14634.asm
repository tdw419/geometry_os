; DESCRIPTION: Places a green line segment connecting (136, 199) to (351, 141).
; PLAN: r0=136(x1), r1=199(y1), r2=351(x2), r3=141(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 199
LDI r2, 351
LDI r3, 141
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
