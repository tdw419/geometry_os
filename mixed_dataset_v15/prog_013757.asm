; DESCRIPTION: Places a magenta line segment connecting (229, 88) to (155, 229).
; PLAN: r0=229(x1), r1=88(y1), r2=155(x2), r3=229(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 88
LDI r2, 155
LDI r3, 229
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
