; DESCRIPTION: Creates a orange circular shape at (259, 171) with radius 60.
; PLAN: r0=259(x), r1=171(y), r2=60(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 259
LDI r1, 171
LDI r2, 60
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
