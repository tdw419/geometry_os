; DESCRIPTION: Places a orange line segment connecting (406, 217) to (134, 214).
; PLAN: r0=406(x1), r1=217(y1), r2=134(x2), r3=214(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 217
LDI r2, 134
LDI r3, 214
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
