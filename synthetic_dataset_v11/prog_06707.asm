; DESCRIPTION: Places a magenta line segment connecting (36, 218) to (232, 245).
; PLAN: r0=36(x1), r1=218(y1), r2=232(x2), r3=245(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 218
LDI r2, 232
LDI r3, 245
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
