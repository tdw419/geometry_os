; DESCRIPTION: Creates a black circular shape at (355, 162) with radius 71.
; PLAN: r0=355(x), r1=162(y), r2=71(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 355
LDI r1, 162
LDI r2, 71
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
