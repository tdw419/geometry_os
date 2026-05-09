; DESCRIPTION: Creates a white circular shape at (420, 117) with radius 73.
; PLAN: r0=420(x), r1=117(y), r2=73(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 420
LDI r1, 117
LDI r2, 73
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
