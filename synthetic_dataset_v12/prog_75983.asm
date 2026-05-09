; DESCRIPTION: Creates a black circular shape at (228, 53) with radius 49.
; PLAN: r0=228(x), r1=53(y), r2=49(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 228
LDI r1, 53
LDI r2, 49
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
