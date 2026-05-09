; DESCRIPTION: Places a magenta line segment connecting (99, 62) to (154, 191).
; PLAN: r0=99(x1), r1=62(y1), r2=154(x2), r3=191(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 62
LDI r2, 154
LDI r3, 191
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
