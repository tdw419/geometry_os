; DESCRIPTION: Places a orange line segment connecting (245, 227) to (40, 98).
; PLAN: r0=245(x1), r1=227(y1), r2=40(x2), r3=98(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 227
LDI r2, 40
LDI r3, 98
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
