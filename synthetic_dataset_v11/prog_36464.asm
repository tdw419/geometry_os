; DESCRIPTION: Creates a black circular shape at (185, 175) with radius 12.
; PLAN: r0=185(x), r1=175(y), r2=12(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 185
LDI r1, 175
LDI r2, 12
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
