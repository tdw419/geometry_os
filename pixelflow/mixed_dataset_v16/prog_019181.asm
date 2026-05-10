; DESCRIPTION: Creates a white circular shape at (361, 125) with radius 70.
; PLAN: r0=361(x), r1=125(y), r2=70(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 361
LDI r1, 125
LDI r2, 70
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
