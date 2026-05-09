; DESCRIPTION: Renders a white line between points (201, 251) and (351, 17).
; PLAN: r0=201(x1), r1=251(y1), r2=351(x2), r3=17(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 251
LDI r2, 351
LDI r3, 17
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
