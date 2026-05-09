; DESCRIPTION: Creates a orange circular shape at (53, 151) with radius 10.
; PLAN: r0=53(x), r1=151(y), r2=10(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 53
LDI r1, 151
LDI r2, 10
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
