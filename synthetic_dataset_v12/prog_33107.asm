; DESCRIPTION: Places a orange line segment connecting (166, 1) to (245, 251).
; PLAN: r0=166(x1), r1=1(y1), r2=245(x2), r3=251(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 1
LDI r2, 245
LDI r3, 251
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
