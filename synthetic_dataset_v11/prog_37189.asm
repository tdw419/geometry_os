; DESCRIPTION: Draws a black circle centered at (157, 127) with radius 12.
; PLAN: r0=157(x), r1=127(y), r2=12(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 157
LDI r1, 127
LDI r2, 12
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
