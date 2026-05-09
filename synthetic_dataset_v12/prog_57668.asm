; DESCRIPTION: Places a orange line segment connecting (452, 133) to (444, 67).
; PLAN: r0=452(x1), r1=133(y1), r2=444(x2), r3=67(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 133
LDI r2, 444
LDI r3, 67
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
