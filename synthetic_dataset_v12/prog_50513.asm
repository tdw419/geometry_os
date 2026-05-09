; DESCRIPTION: Draws a black circle centered at (386, 62) with radius 37.
; PLAN: r0=386(x), r1=62(y), r2=37(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 386
LDI r1, 62
LDI r2, 37
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
