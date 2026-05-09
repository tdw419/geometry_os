; DESCRIPTION: Places a magenta line segment connecting (37, 5) to (261, 245).
; PLAN: r0=37(x1), r1=5(y1), r2=261(x2), r3=245(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 5
LDI r2, 261
LDI r3, 245
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
