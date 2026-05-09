; DESCRIPTION: Draws a black circle centered at (347, 97) with radius 54.
; PLAN: r0=347(x), r1=97(y), r2=54(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 347
LDI r1, 97
LDI r2, 54
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
