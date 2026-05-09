; DESCRIPTION: Places a purple line segment connecting (402, 15) to (199, 75).
; PLAN: r0=402(x1), r1=15(y1), r2=199(x2), r3=75(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 15
LDI r2, 199
LDI r3, 75
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
