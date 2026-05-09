; DESCRIPTION: Creates a black circular shape at (100, 113) with radius 48.
; PLAN: r0=100(x), r1=113(y), r2=48(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 113
LDI r2, 48
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
