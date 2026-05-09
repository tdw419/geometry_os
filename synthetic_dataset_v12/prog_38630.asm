; DESCRIPTION: Draws a black circle centered at (225, 169) with radius 60.
; PLAN: r0=225(x), r1=169(y), r2=60(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 225
LDI r1, 169
LDI r2, 60
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
