; DESCRIPTION: Places a orange line segment connecting (311, 121) to (37, 62).
; PLAN: r0=311(x1), r1=121(y1), r2=37(x2), r3=62(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 121
LDI r2, 37
LDI r3, 62
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
