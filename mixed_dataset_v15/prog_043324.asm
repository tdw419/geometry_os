; DESCRIPTION: Places a magenta line segment connecting (332, 87) to (139, 205).
; PLAN: r0=332(x1), r1=87(y1), r2=139(x2), r3=205(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 87
LDI r2, 139
LDI r3, 205
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
