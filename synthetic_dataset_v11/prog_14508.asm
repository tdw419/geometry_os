; DESCRIPTION: Places a orange line segment connecting (88, 247) to (164, 70).
; PLAN: r0=88(x1), r1=247(y1), r2=164(x2), r3=70(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 247
LDI r2, 164
LDI r3, 70
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
