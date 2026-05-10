; DESCRIPTION: Creates a orange circular shape at (338, 139) with radius 48.
; PLAN: r0=338(x), r1=139(y), r2=48(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 338
LDI r1, 139
LDI r2, 48
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
