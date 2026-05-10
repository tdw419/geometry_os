; DESCRIPTION: Renders a white line segment connecting (98, 192) to (351, 191).
; PLAN: r0=98(x1), r1=192(y1), r2=351(x2), r3=191(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 192
LDI r2, 351
LDI r3, 191
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
