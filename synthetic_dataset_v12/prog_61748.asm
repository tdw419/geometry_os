; DESCRIPTION: Creates a black circular shape at (261, 80) with radius 79.
; PLAN: r0=261(x), r1=80(y), r2=79(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 261
LDI r1, 80
LDI r2, 79
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
