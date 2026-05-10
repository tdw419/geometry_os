; DESCRIPTION: Places a magenta line segment connecting (172, 13) to (99, 218).
; PLAN: r0=172(x1), r1=13(y1), r2=99(x2), r3=218(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 13
LDI r2, 99
LDI r3, 218
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
