; DESCRIPTION: Places a orange line segment connecting (102, 115) to (54, 94).
; PLAN: r0=102(x1), r1=115(y1), r2=54(x2), r3=94(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 115
LDI r2, 54
LDI r3, 94
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
