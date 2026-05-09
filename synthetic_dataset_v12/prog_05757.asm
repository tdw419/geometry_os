; DESCRIPTION: Places a orange line segment connecting (68, 141) to (93, 183).
; PLAN: r0=68(x1), r1=141(y1), r2=93(x2), r3=183(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 141
LDI r2, 93
LDI r3, 183
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
