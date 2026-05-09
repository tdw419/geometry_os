; DESCRIPTION: Places a blue line segment connecting (251, 54) to (99, 245).
; PLAN: r0=251(x1), r1=54(y1), r2=99(x2), r3=245(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 54
LDI r2, 99
LDI r3, 245
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
