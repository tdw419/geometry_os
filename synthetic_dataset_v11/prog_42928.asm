; DESCRIPTION: Places a orange circle of radius 15 at center (184, 24).
; PLAN: r0=184(x), r1=24(y), r2=15(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 184
LDI r1, 24
LDI r2, 15
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
