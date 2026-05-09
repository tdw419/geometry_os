; DESCRIPTION: Draws a black circle centered at (172, 135) with radius 43.
; PLAN: r0=172(x), r1=135(y), r2=43(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 172
LDI r1, 135
LDI r2, 43
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
