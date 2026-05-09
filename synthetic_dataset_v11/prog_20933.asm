; DESCRIPTION: Draws a black circle centered at (221, 138) with radius 25.
; PLAN: r0=221(x), r1=138(y), r2=25(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 221
LDI r1, 138
LDI r2, 25
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
