; DESCRIPTION: Places a orange line segment connecting (270, 254) to (53, 247).
; PLAN: r0=270(x1), r1=254(y1), r2=53(x2), r3=247(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 254
LDI r2, 53
LDI r3, 247
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
