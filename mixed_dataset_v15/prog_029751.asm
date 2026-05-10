; DESCRIPTION: Creates a red circular shape at (397, 167) with radius 35.
; PLAN: r0=397(x), r1=167(y), r2=35(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 397
LDI r1, 167
LDI r2, 35
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
