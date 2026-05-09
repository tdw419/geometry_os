; DESCRIPTION: Places a yellow line segment connecting (421, 212) to (351, 60).
; PLAN: r0=421(x1), r1=212(y1), r2=351(x2), r3=60(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 212
LDI r2, 351
LDI r3, 60
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
