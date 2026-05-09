; DESCRIPTION: Places a orange circle of radius 64 at center (282, 122).
; PLAN: r0=282(x), r1=122(y), r2=64(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 282
LDI r1, 122
LDI r2, 64
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
