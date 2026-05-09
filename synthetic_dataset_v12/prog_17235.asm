; DESCRIPTION: Draws a black circle centered at (321, 69) with radius 46.
; PLAN: r0=321(x), r1=69(y), r2=46(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 321
LDI r1, 69
LDI r2, 46
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
