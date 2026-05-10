; DESCRIPTION: Creates a black circular shape at (79, 196) with radius 55.
; PLAN: r0=79(x), r1=196(y), r2=55(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 79
LDI r1, 196
LDI r2, 55
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
