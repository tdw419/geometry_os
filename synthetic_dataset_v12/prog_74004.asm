; DESCRIPTION: Draws a black circle centered at (228, 182) with radius 63.
; PLAN: r0=228(x), r1=182(y), r2=63(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 228
LDI r1, 182
LDI r2, 63
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
