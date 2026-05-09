; DESCRIPTION: Creates a black circular shape at (168, 107) with radius 78.
; PLAN: r0=168(x), r1=107(y), r2=78(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 107
LDI r2, 78
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
