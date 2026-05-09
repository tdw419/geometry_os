; DESCRIPTION: Places a orange line segment connecting (73, 81) to (429, 137).
; PLAN: r0=73(x1), r1=81(y1), r2=429(x2), r3=137(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 81
LDI r2, 429
LDI r3, 137
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
