; DESCRIPTION: Places a orange line segment connecting (313, 170) to (354, 36).
; PLAN: r0=313(x1), r1=170(y1), r2=354(x2), r3=36(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 170
LDI r2, 354
LDI r3, 36
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
