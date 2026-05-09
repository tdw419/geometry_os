; DESCRIPTION: Creates a black circular shape at (102, 163) with radius 68.
; PLAN: r0=102(x), r1=163(y), r2=68(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 163
LDI r2, 68
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
