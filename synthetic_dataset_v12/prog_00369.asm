; DESCRIPTION: Places a green line segment connecting (124, 30) to (351, 250).
; PLAN: r0=124(x1), r1=30(y1), r2=351(x2), r3=250(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 30
LDI r2, 351
LDI r3, 250
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
