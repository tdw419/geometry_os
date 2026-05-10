; DESCRIPTION: Places a magenta line segment connecting (77, 54) to (86, 205).
; PLAN: r0=77(x1), r1=54(y1), r2=86(x2), r3=205(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 54
LDI r2, 86
LDI r3, 205
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
