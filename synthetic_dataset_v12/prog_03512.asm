; DESCRIPTION: Creates a black circular shape at (332, 149) with radius 36.
; PLAN: r0=332(x), r1=149(y), r2=36(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 332
LDI r1, 149
LDI r2, 36
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
