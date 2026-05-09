; DESCRIPTION: Places a orange line segment connecting (232, 69) to (306, 109).
; PLAN: r0=232(x1), r1=69(y1), r2=306(x2), r3=109(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 69
LDI r2, 306
LDI r3, 109
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
