; DESCRIPTION: Places a orange line segment connecting (133, 86) to (141, 5).
; PLAN: r0=133(x1), r1=86(y1), r2=141(x2), r3=5(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 86
LDI r2, 141
LDI r3, 5
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
