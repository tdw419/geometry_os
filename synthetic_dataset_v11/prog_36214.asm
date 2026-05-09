; DESCRIPTION: Places a orange line segment connecting (26, 43) to (251, 14).
; PLAN: r0=26(x1), r1=43(y1), r2=251(x2), r3=14(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 43
LDI r2, 251
LDI r3, 14
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
