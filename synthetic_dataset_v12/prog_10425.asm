; DESCRIPTION: Creates a black circular shape at (267, 52) with radius 48.
; PLAN: r0=267(x), r1=52(y), r2=48(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 267
LDI r1, 52
LDI r2, 48
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
