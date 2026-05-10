; DESCRIPTION: Creates a white circular shape at (359, 171) with radius 76.
; PLAN: r0=359(x), r1=171(y), r2=76(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 359
LDI r1, 171
LDI r2, 76
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
