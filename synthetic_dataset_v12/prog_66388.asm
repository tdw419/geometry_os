; DESCRIPTION: Draws a black circle centered at (76, 127) with radius 60.
; PLAN: r0=76(x), r1=127(y), r2=60(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 127
LDI r2, 60
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
