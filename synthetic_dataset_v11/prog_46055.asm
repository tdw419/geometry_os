; DESCRIPTION: Places a magenta line segment connecting (39, 155) to (78, 212).
; PLAN: r0=39(x1), r1=155(y1), r2=78(x2), r3=212(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 155
LDI r2, 78
LDI r3, 212
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
