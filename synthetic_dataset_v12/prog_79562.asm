; DESCRIPTION: Creates a black circular shape at (282, 79) with radius 16.
; PLAN: r0=282(x), r1=79(y), r2=16(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 282
LDI r1, 79
LDI r2, 16
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
