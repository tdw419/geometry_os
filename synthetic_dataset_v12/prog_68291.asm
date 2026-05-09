; DESCRIPTION: Creates a black circular shape at (238, 215) with radius 30.
; PLAN: r0=238(x), r1=215(y), r2=30(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 238
LDI r1, 215
LDI r2, 30
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
