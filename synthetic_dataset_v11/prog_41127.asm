; DESCRIPTION: Draws a black circle centered at (112, 162) with radius 58.
; PLAN: r0=112(x), r1=162(y), r2=58(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 162
LDI r2, 58
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
