; DESCRIPTION: Places a orange line segment connecting (343, 98) to (509, 80).
; PLAN: r0=343(x1), r1=98(y1), r2=509(x2), r3=80(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 98
LDI r2, 509
LDI r3, 80
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
