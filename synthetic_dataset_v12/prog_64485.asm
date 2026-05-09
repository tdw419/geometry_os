; DESCRIPTION: Places a orange line segment connecting (429, 72) to (11, 187).
; PLAN: r0=429(x1), r1=72(y1), r2=11(x2), r3=187(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 72
LDI r2, 11
LDI r3, 187
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
