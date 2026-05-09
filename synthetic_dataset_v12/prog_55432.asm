; DESCRIPTION: Places a orange line segment connecting (423, 238) to (194, 47).
; PLAN: r0=423(x1), r1=238(y1), r2=194(x2), r3=47(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 238
LDI r2, 194
LDI r3, 47
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
