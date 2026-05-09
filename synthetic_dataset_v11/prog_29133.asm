; DESCRIPTION: Places a magenta line segment connecting (80, 10) to (13, 129).
; PLAN: r0=80(x1), r1=10(y1), r2=13(x2), r3=129(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 10
LDI r2, 13
LDI r3, 129
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
