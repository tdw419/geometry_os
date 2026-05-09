; DESCRIPTION: Creates a white circular shape at (210, 134) with radius 62.
; PLAN: r0=210(x), r1=134(y), r2=62(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 210
LDI r1, 134
LDI r2, 62
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
