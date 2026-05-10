; DESCRIPTION: Places a orange line segment connecting (461, 85) to (330, 69).
; PLAN: r0=461(x1), r1=85(y1), r2=330(x2), r3=69(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 85
LDI r2, 330
LDI r3, 69
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
