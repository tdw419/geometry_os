; DESCRIPTION: Places a orange line segment connecting (102, 86) to (185, 122).
; PLAN: r0=102(x1), r1=86(y1), r2=185(x2), r3=122(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 86
LDI r2, 185
LDI r3, 122
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
