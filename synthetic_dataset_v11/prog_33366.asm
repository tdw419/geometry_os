; DESCRIPTION: Places a yellow line segment connecting (163, 108) to (134, 78).
; PLAN: r0=163(x1), r1=108(y1), r2=134(x2), r3=78(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 108
LDI r2, 134
LDI r3, 78
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
