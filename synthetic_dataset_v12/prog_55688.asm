; DESCRIPTION: Places a magenta line segment connecting (169, 192) to (25, 0).
; PLAN: r0=169(x1), r1=192(y1), r2=25(x2), r3=0(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 192
LDI r2, 25
LDI r3, 0
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
