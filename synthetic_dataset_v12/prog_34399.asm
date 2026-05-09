; DESCRIPTION: Places a magenta line segment connecting (49, 14) to (133, 89).
; PLAN: r0=49(x1), r1=14(y1), r2=133(x2), r3=89(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 14
LDI r2, 133
LDI r3, 89
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
