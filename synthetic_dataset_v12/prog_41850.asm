; DESCRIPTION: Places a orange circle of radius 62 at center (244, 184).
; PLAN: r0=244(x), r1=184(y), r2=62(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 244
LDI r1, 184
LDI r2, 62
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
