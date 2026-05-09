; DESCRIPTION: Places a green line segment connecting (351, 226) to (297, 140).
; PLAN: r0=351(x1), r1=226(y1), r2=297(x2), r3=140(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 226
LDI r2, 297
LDI r3, 140
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
