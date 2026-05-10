; DESCRIPTION: Places a orange line segment connecting (134, 248) to (250, 66).
; PLAN: r0=134(x1), r1=248(y1), r2=250(x2), r3=66(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 248
LDI r2, 250
LDI r3, 66
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
