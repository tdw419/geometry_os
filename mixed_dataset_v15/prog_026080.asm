; DESCRIPTION: Places a orange line segment connecting (366, 185) to (452, 71).
; PLAN: r0=366(x1), r1=185(y1), r2=452(x2), r3=71(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 185
LDI r2, 452
LDI r3, 71
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
