; DESCRIPTION: Places a orange line segment connecting (325, 22) to (429, 106).
; PLAN: r0=325(x1), r1=22(y1), r2=429(x2), r3=106(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 22
LDI r2, 429
LDI r3, 106
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
