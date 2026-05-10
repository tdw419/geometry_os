; DESCRIPTION: Places a orange line segment connecting (367, 148) to (367, 43).
; PLAN: r0=367(x1), r1=148(y1), r2=367(x2), r3=43(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 148
LDI r2, 367
LDI r3, 43
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
