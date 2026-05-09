; DESCRIPTION: Places a orange line segment connecting (53, 155) to (313, 239).
; PLAN: r0=53(x1), r1=155(y1), r2=313(x2), r3=239(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 155
LDI r2, 313
LDI r3, 239
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
