; DESCRIPTION: Creates a black circular shape at (460, 53) with radius 51.
; PLAN: r0=460(x), r1=53(y), r2=51(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 460
LDI r1, 53
LDI r2, 51
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
