; DESCRIPTION: Places a orange line segment connecting (76, 49) to (216, 61).
; PLAN: r0=76(x1), r1=49(y1), r2=216(x2), r3=61(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 49
LDI r2, 216
LDI r3, 61
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
