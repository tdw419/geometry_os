; DESCRIPTION: Creates a white circular shape at (420, 57) with radius 49.
; PLAN: r0=420(x), r1=57(y), r2=49(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 420
LDI r1, 57
LDI r2, 49
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
