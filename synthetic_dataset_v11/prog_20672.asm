; DESCRIPTION: Creates a black circular shape at (176, 171) with radius 74.
; PLAN: r0=176(x), r1=171(y), r2=74(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 171
LDI r2, 74
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
