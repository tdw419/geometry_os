; DESCRIPTION: Creates a white circular shape at (141, 184) with radius 32.
; PLAN: r0=141(x), r1=184(y), r2=32(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 141
LDI r1, 184
LDI r2, 32
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
