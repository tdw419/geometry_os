; DESCRIPTION: Creates a black circular shape at (344, 43) with radius 43.
; PLAN: r0=344(x), r1=43(y), r2=43(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 344
LDI r1, 43
LDI r2, 43
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
