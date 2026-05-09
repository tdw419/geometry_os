; DESCRIPTION: Draws a black circle centered at (73, 177) with radius 55.
; PLAN: r0=73(x), r1=177(y), r2=55(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 73
LDI r1, 177
LDI r2, 55
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
