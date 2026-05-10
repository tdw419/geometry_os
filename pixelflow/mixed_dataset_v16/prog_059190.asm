; DESCRIPTION: Creates a white circular shape at (234, 175) with radius 74.
; PLAN: r0=234(x), r1=175(y), r2=74(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 234
LDI r1, 175
LDI r2, 74
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
