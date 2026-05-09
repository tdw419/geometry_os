; DESCRIPTION: Creates a black circular shape at (210, 73) with radius 30.
; PLAN: r0=210(x), r1=73(y), r2=30(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 210
LDI r1, 73
LDI r2, 30
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
