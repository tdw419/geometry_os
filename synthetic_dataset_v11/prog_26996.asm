; DESCRIPTION: Draws a black circle centered at (158, 44) with radius 32.
; PLAN: r0=158(x), r1=44(y), r2=32(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 44
LDI r2, 32
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
