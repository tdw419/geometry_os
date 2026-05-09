; DESCRIPTION: Places a green line segment connecting (199, 158) to (459, 245).
; PLAN: r0=199(x1), r1=158(y1), r2=459(x2), r3=245(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 158
LDI r2, 459
LDI r3, 245
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
