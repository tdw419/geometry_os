; DESCRIPTION: Places a yellow line segment connecting (133, 184) to (85, 105).
; PLAN: r0=133(x1), r1=184(y1), r2=85(x2), r3=105(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 184
LDI r2, 85
LDI r3, 105
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
