; DESCRIPTION: Places a orange line segment connecting (180, 26) to (232, 102).
; PLAN: r0=180(x1), r1=26(y1), r2=232(x2), r3=102(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 26
LDI r2, 232
LDI r3, 102
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
