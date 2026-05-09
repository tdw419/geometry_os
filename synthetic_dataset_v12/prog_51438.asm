; DESCRIPTION: Draws a black circle centered at (223, 104) with radius 25.
; PLAN: r0=223(x), r1=104(y), r2=25(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 223
LDI r1, 104
LDI r2, 25
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
