; DESCRIPTION: Draws a black circle centered at (123, 157) with radius 18.
; PLAN: r0=123(x), r1=157(y), r2=18(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 123
LDI r1, 157
LDI r2, 18
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
