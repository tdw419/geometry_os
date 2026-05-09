; DESCRIPTION: Draws a blue circle centered at (58, 182) with radius 32.
; PLAN: r0=58(x), r1=182(y), r2=32(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 58
LDI r1, 182
LDI r2, 32
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
