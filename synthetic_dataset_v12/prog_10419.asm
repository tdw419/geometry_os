; DESCRIPTION: Places a orange line segment connecting (408, 251) to (11, 176).
; PLAN: r0=408(x1), r1=251(y1), r2=11(x2), r3=176(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 251
LDI r2, 11
LDI r3, 176
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
