; DESCRIPTION: Places a magenta line segment connecting (185, 89) to (4, 129).
; PLAN: r0=185(x1), r1=89(y1), r2=4(x2), r3=129(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 89
LDI r2, 4
LDI r3, 129
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
