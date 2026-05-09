; DESCRIPTION: Places a purple line segment connecting (206, 252) to (251, 245).
; PLAN: r0=206(x1), r1=252(y1), r2=251(x2), r3=245(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 252
LDI r2, 251
LDI r3, 245
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
