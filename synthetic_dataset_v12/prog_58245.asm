; DESCRIPTION: Places a orange circle of radius 76 at center (341, 115).
; PLAN: r0=341(x), r1=115(y), r2=76(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 341
LDI r1, 115
LDI r2, 76
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
