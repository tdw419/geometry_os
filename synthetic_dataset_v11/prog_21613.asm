; DESCRIPTION: Draws a black circle centered at (186, 81) with radius 49.
; PLAN: r0=186(x), r1=81(y), r2=49(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 186
LDI r1, 81
LDI r2, 49
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
