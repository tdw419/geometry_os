; DESCRIPTION: Places a orange circle of radius 69 at center (396, 72).
; PLAN: r0=396(x), r1=72(y), r2=69(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 396
LDI r1, 72
LDI r2, 69
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
