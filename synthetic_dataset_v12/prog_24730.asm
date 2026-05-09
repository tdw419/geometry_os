; DESCRIPTION: Creates a white circular shape at (361, 159) with radius 18.
; PLAN: r0=361(x), r1=159(y), r2=18(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 361
LDI r1, 159
LDI r2, 18
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
