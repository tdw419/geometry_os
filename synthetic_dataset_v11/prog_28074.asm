; DESCRIPTION: Places a orange line segment connecting (145, 127) to (89, 157).
; PLAN: r0=145(x1), r1=127(y1), r2=89(x2), r3=157(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 127
LDI r2, 89
LDI r3, 157
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
