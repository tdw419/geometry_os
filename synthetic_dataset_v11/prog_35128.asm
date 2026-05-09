; DESCRIPTION: Draws a black circle centered at (186, 183) with radius 60.
; PLAN: r0=186(x), r1=183(y), r2=60(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 186
LDI r1, 183
LDI r2, 60
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
