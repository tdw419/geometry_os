; DESCRIPTION: Draws a black circle centered at (137, 150) with radius 59.
; PLAN: r0=137(x), r1=150(y), r2=59(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 137
LDI r1, 150
LDI r2, 59
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
