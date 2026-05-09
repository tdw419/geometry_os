; DESCRIPTION: Draws a black circle centered at (173, 138) with radius 39.
; PLAN: r0=173(x), r1=138(y), r2=39(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 173
LDI r1, 138
LDI r2, 39
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
