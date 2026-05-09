; DESCRIPTION: Places a white line segment connecting (351, 40) to (297, 193).
; PLAN: r0=351(x1), r1=40(y1), r2=297(x2), r3=193(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 40
LDI r2, 297
LDI r3, 193
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
