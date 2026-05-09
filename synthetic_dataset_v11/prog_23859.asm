; DESCRIPTION: Creates a orange circular shape at (159, 139) with radius 71.
; PLAN: r0=159(x), r1=139(y), r2=71(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 159
LDI r1, 139
LDI r2, 71
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
