; DESCRIPTION: Draws a black circle centered at (144, 131) with radius 29.
; PLAN: r0=144(x), r1=131(y), r2=29(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 131
LDI r2, 29
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
