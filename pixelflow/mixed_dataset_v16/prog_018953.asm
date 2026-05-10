; DESCRIPTION: Creates a black circular shape at (456, 92) with radius 39.
; PLAN: r0=456(x), r1=92(y), r2=39(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 456
LDI r1, 92
LDI r2, 39
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
