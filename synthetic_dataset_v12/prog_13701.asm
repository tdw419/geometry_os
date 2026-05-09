; DESCRIPTION: Creates a black circular shape at (362, 142) with radius 61.
; PLAN: r0=362(x), r1=142(y), r2=61(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 362
LDI r1, 142
LDI r2, 61
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
