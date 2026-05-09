; DESCRIPTION: Creates a black circular shape at (358, 181) with radius 46.
; PLAN: r0=358(x), r1=181(y), r2=46(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 358
LDI r1, 181
LDI r2, 46
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
