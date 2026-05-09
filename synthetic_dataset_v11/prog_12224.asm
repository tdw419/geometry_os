; DESCRIPTION: Places a orange line segment connecting (0, 245) to (134, 87).
; PLAN: r0=0(x1), r1=245(y1), r2=134(x2), r3=87(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 245
LDI r2, 134
LDI r3, 87
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
