; DESCRIPTION: Places a magenta line segment connecting (453, 197) to (357, 131).
; PLAN: r0=453(x1), r1=197(y1), r2=357(x2), r3=131(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 197
LDI r2, 357
LDI r3, 131
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
