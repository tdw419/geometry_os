; DESCRIPTION: Draws a black circle centered at (62, 60) with radius 50.
; PLAN: r0=62(x), r1=60(y), r2=50(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 62
LDI r1, 60
LDI r2, 50
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
