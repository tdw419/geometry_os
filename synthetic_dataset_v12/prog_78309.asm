; DESCRIPTION: Creates a black circular shape at (168, 166) with radius 73.
; PLAN: r0=168(x), r1=166(y), r2=73(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 166
LDI r2, 73
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
