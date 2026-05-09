; DESCRIPTION: Places a magenta line segment connecting (94, 6) to (47, 224).
; PLAN: r0=94(x1), r1=6(y1), r2=47(x2), r3=224(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 6
LDI r2, 47
LDI r3, 224
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
