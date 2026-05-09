; DESCRIPTION: Places a magenta line segment connecting (369, 161) to (402, 131).
; PLAN: r0=369(x1), r1=161(y1), r2=402(x2), r3=131(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 161
LDI r2, 402
LDI r3, 131
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
