; DESCRIPTION: Places a orange disk with center (254, 61) and radius 62.
; PLAN: r0=254(x), r1=61(y), r2=62(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 254
LDI r1, 61
LDI r2, 62
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
