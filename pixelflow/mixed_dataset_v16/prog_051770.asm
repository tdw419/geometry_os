; DESCRIPTION: Creates a orange circular shape at (496, 113) with radius 12.
; PLAN: r0=496(x), r1=113(y), r2=12(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 496
LDI r1, 113
LDI r2, 12
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
