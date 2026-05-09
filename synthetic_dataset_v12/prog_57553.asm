; DESCRIPTION: Places a blue line segment connecting (439, 238) to (351, 20).
; PLAN: r0=439(x1), r1=238(y1), r2=351(x2), r3=20(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 238
LDI r2, 351
LDI r3, 20
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
