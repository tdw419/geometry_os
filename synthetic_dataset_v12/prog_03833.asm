; DESCRIPTION: Creates a black circular shape at (171, 46) with radius 30.
; PLAN: r0=171(x), r1=46(y), r2=30(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 171
LDI r1, 46
LDI r2, 30
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
