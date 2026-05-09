; DESCRIPTION: Creates a white circular shape at (143, 171) with radius 64.
; PLAN: r0=143(x), r1=171(y), r2=64(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 143
LDI r1, 171
LDI r2, 64
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
