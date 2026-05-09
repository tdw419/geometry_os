; DESCRIPTION: Places a orange line segment connecting (189, 69) to (25, 184).
; PLAN: r0=189(x1), r1=69(y1), r2=25(x2), r3=184(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 69
LDI r2, 25
LDI r3, 184
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
