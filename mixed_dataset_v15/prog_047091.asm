; DESCRIPTION: Draws a black circle centered at (101, 153) with radius 12.
; PLAN: r0=101(x), r1=153(y), r2=12(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 101
LDI r1, 153
LDI r2, 12
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
