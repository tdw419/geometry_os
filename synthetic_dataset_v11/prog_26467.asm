; DESCRIPTION: Creates a white circular shape at (128, 75) with radius 51.
; PLAN: r0=128(x), r1=75(y), r2=51(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 128
LDI r1, 75
LDI r2, 51
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
