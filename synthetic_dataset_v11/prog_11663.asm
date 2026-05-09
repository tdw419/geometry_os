; DESCRIPTION: Creates a white circular shape at (131, 72) with radius 51.
; PLAN: r0=131(x), r1=72(y), r2=51(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 72
LDI r2, 51
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
