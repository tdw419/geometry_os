; DESCRIPTION: Draws a black circle centered at (46, 172) with radius 28.
; PLAN: r0=46(x), r1=172(y), r2=28(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 46
LDI r1, 172
LDI r2, 28
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
