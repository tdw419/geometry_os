; DESCRIPTION: Places a orange line segment connecting (55, 29) to (499, 245).
; PLAN: r0=55(x1), r1=29(y1), r2=499(x2), r3=245(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 29
LDI r2, 499
LDI r3, 245
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
