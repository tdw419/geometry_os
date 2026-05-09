; DESCRIPTION: Places a orange line segment connecting (159, 3) to (182, 73).
; PLAN: r0=159(x1), r1=3(y1), r2=182(x2), r3=73(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 3
LDI r2, 182
LDI r3, 73
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
