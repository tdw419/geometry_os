; DESCRIPTION: Places a magenta line segment connecting (129, 229) to (169, 175).
; PLAN: r0=129(x1), r1=229(y1), r2=169(x2), r3=175(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 229
LDI r2, 169
LDI r3, 175
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
