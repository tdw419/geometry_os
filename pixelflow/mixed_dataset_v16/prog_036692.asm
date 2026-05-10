; DESCRIPTION: Places a yellow line segment connecting (185, 112) to (351, 139).
; PLAN: r0=185(x1), r1=112(y1), r2=351(x2), r3=139(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 112
LDI r2, 351
LDI r3, 139
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
