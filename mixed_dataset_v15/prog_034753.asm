; DESCRIPTION: Places a orange circle of radius 13 at center (375, 43).
; PLAN: r0=375(x), r1=43(y), r2=13(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 375
LDI r1, 43
LDI r2, 13
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
