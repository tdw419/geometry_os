; DESCRIPTION: Places a orange circle of radius 32 at center (134, 69).
; PLAN: r0=134(x), r1=69(y), r2=32(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 69
LDI r2, 32
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
