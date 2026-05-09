; DESCRIPTION: Places a magenta line segment connecting (76, 198) to (23, 116).
; PLAN: r0=76(x1), r1=198(y1), r2=23(x2), r3=116(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 198
LDI r2, 23
LDI r3, 116
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
