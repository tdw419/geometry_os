; DESCRIPTION: Places a magenta line segment connecting (21, 155) to (419, 43).
; PLAN: r0=21(x1), r1=155(y1), r2=419(x2), r3=43(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 155
LDI r2, 419
LDI r3, 43
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
