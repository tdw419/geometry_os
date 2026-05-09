; DESCRIPTION: Places a purple line segment connecting (10, 4) to (281, 245).
; PLAN: r0=10(x1), r1=4(y1), r2=281(x2), r3=245(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 4
LDI r2, 281
LDI r3, 245
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
