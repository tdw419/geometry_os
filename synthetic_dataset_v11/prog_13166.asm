; DESCRIPTION: Draws a black circle centered at (103, 169) with radius 72.
; PLAN: r0=103(x), r1=169(y), r2=72(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 103
LDI r1, 169
LDI r2, 72
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
