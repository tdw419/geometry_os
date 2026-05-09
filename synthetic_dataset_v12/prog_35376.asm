; DESCRIPTION: Creates a white circular shape at (173, 125) with radius 76.
; PLAN: r0=173(x), r1=125(y), r2=76(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 173
LDI r1, 125
LDI r2, 76
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
