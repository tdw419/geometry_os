; DESCRIPTION: Places a magenta line segment connecting (138, 109) to (163, 232).
; PLAN: r0=138(x1), r1=109(y1), r2=163(x2), r3=232(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 109
LDI r2, 163
LDI r3, 232
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
