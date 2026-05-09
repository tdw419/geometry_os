; DESCRIPTION: Creates a white circular shape at (195, 163) with radius 14.
; PLAN: r0=195(x), r1=163(y), r2=14(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 195
LDI r1, 163
LDI r2, 14
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
