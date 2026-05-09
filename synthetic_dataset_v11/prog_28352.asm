; DESCRIPTION: Places a magenta line segment connecting (89, 34) to (22, 176).
; PLAN: r0=89(x1), r1=34(y1), r2=22(x2), r3=176(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 34
LDI r2, 22
LDI r3, 176
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
