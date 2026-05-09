; DESCRIPTION: Places a orange line segment connecting (53, 186) to (338, 78).
; PLAN: r0=53(x1), r1=186(y1), r2=338(x2), r3=78(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 186
LDI r2, 338
LDI r3, 78
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
