; DESCRIPTION: Places a magenta line segment connecting (71, 156) to (402, 49).
; PLAN: r0=71(x1), r1=156(y1), r2=402(x2), r3=49(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 156
LDI r2, 402
LDI r3, 49
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
