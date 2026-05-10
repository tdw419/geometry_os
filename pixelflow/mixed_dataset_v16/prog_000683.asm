; DESCRIPTION: Creates a black circular shape at (214, 125) with radius 28.
; PLAN: r0=214(x), r1=125(y), r2=28(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 214
LDI r1, 125
LDI r2, 28
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
