; DESCRIPTION: Places a magenta line segment connecting (84, 33) to (190, 232).
; PLAN: r0=84(x1), r1=33(y1), r2=190(x2), r3=232(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 33
LDI r2, 190
LDI r3, 232
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
