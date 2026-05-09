; DESCRIPTION: Places a orange line segment connecting (354, 46) to (158, 232).
; PLAN: r0=354(x1), r1=46(y1), r2=158(x2), r3=232(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 46
LDI r2, 158
LDI r3, 232
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
