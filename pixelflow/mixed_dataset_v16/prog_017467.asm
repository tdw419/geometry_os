; DESCRIPTION: Places a orange line segment connecting (461, 155) to (357, 253).
; PLAN: r0=461(x1), r1=155(y1), r2=357(x2), r3=253(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 155
LDI r2, 357
LDI r3, 253
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
