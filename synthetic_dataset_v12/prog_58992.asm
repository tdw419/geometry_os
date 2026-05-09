; DESCRIPTION: Places a orange line segment connecting (67, 89) to (414, 15).
; PLAN: r0=67(x1), r1=89(y1), r2=414(x2), r3=15(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 89
LDI r2, 414
LDI r3, 15
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
