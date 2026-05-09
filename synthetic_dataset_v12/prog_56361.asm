; DESCRIPTION: Places a orange line segment connecting (461, 15) to (355, 223).
; PLAN: r0=461(x1), r1=15(y1), r2=355(x2), r3=223(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 15
LDI r2, 355
LDI r3, 223
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
