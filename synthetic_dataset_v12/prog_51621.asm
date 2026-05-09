; DESCRIPTION: Creates a black circular shape at (92, 202) with radius 47.
; PLAN: r0=92(x), r1=202(y), r2=47(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 92
LDI r1, 202
LDI r2, 47
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
