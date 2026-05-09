; DESCRIPTION: Draws a black circle centered at (125, 141) with radius 38.
; PLAN: r0=125(x), r1=141(y), r2=38(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 125
LDI r1, 141
LDI r2, 38
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
