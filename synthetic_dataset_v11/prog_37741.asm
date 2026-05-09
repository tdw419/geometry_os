; DESCRIPTION: Places a orange line segment connecting (156, 219) to (122, 103).
; PLAN: r0=156(x1), r1=219(y1), r2=122(x2), r3=103(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 219
LDI r2, 122
LDI r3, 103
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
