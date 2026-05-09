; DESCRIPTION: Creates a white circular shape at (397, 161) with radius 51.
; PLAN: r0=397(x), r1=161(y), r2=51(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 397
LDI r1, 161
LDI r2, 51
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
