; DESCRIPTION: Creates a orange circular shape at (214, 140) with radius 39.
; PLAN: r0=214(x), r1=140(y), r2=39(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 214
LDI r1, 140
LDI r2, 39
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
