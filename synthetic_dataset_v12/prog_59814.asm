; DESCRIPTION: Creates a white circular shape at (373, 225) with radius 15.
; PLAN: r0=373(x), r1=225(y), r2=15(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 373
LDI r1, 225
LDI r2, 15
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
