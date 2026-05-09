; DESCRIPTION: Creates a white circular shape at (151, 151) with radius 21.
; PLAN: r0=151(x), r1=151(y), r2=21(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 151
LDI r2, 21
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
