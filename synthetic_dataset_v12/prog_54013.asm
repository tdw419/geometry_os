; DESCRIPTION: Places a orange line segment connecting (99, 155) to (10, 214).
; PLAN: r0=99(x1), r1=155(y1), r2=10(x2), r3=214(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 155
LDI r2, 10
LDI r3, 214
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
