; DESCRIPTION: Places a orange line segment connecting (20, 15) to (438, 102).
; PLAN: r0=20(x1), r1=15(y1), r2=438(x2), r3=102(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 15
LDI r2, 438
LDI r3, 102
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
