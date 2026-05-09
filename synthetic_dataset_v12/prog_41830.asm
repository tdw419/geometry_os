; DESCRIPTION: Creates a white circular shape at (265, 198) with radius 57.
; PLAN: r0=265(x), r1=198(y), r2=57(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 265
LDI r1, 198
LDI r2, 57
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
