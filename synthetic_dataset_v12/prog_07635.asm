; DESCRIPTION: Places a orange circle of radius 56 at center (359, 69).
; PLAN: r0=359(x), r1=69(y), r2=56(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 359
LDI r1, 69
LDI r2, 56
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
