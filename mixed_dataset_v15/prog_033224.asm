; DESCRIPTION: Creates a white circular shape at (141, 210) with radius 25.
; PLAN: r0=141(x), r1=210(y), r2=25(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 141
LDI r1, 210
LDI r2, 25
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
