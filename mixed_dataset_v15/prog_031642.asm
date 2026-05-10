; DESCRIPTION: Places a orange line segment connecting (497, 55) to (287, 176).
; PLAN: r0=497(x1), r1=55(y1), r2=287(x2), r3=176(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 55
LDI r2, 287
LDI r3, 176
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
