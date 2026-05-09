; DESCRIPTION: Places a orange line segment connecting (475, 58) to (496, 67).
; PLAN: r0=475(x1), r1=58(y1), r2=496(x2), r3=67(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 58
LDI r2, 496
LDI r3, 67
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
