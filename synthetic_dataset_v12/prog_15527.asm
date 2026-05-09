; DESCRIPTION: Creates a black circular shape at (330, 175) with radius 79.
; PLAN: r0=330(x), r1=175(y), r2=79(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 330
LDI r1, 175
LDI r2, 79
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
