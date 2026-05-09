; DESCRIPTION: Creates a white circular shape at (160, 171) with radius 77.
; PLAN: r0=160(x), r1=171(y), r2=77(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 160
LDI r1, 171
LDI r2, 77
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
