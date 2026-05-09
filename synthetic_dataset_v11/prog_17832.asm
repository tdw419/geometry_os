; DESCRIPTION: Draws a black circle centered at (77, 46) with radius 13.
; PLAN: r0=77(x), r1=46(y), r2=13(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 46
LDI r2, 13
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
