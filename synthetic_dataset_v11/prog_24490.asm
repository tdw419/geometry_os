; DESCRIPTION: Creates a black circular shape at (45, 92) with radius 42.
; PLAN: r0=45(x), r1=92(y), r2=42(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 45
LDI r1, 92
LDI r2, 42
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
