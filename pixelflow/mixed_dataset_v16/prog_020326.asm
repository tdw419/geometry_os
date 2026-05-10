; DESCRIPTION: Draws a black circle centered at (431, 200) with radius 25.
; PLAN: r0=431(x), r1=200(y), r2=25(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 431
LDI r1, 200
LDI r2, 25
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
