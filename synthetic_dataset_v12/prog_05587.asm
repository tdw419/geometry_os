; DESCRIPTION: Places a orange line segment connecting (378, 225) to (118, 102).
; PLAN: r0=378(x1), r1=225(y1), r2=118(x2), r3=102(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 225
LDI r2, 118
LDI r3, 102
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
