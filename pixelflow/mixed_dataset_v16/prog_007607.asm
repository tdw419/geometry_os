; DESCRIPTION: Draws a black circle centered at (450, 49) with radius 43.
; PLAN: r0=450(x), r1=49(y), r2=43(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 450
LDI r1, 49
LDI r2, 43
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
