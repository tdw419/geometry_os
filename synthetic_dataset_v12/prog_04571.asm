; DESCRIPTION: Places a magenta line segment connecting (109, 12) to (142, 85).
; PLAN: r0=109(x1), r1=12(y1), r2=142(x2), r3=85(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 12
LDI r2, 142
LDI r3, 85
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
