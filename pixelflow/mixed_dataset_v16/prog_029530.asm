; DESCRIPTION: Places a magenta line segment connecting (232, 58) to (169, 20).
; PLAN: r0=232(x1), r1=58(y1), r2=169(x2), r3=20(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 58
LDI r2, 169
LDI r3, 20
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
