; DESCRIPTION: Composite: Draws a magenta circle centered at (351, 147) with radius 24 then Places a purple dot at position (0, 251).
; PLAN: r0=351(x), r1=147(y), r2=24(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=0(x), r6=251(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 351
LDI r1, 147
LDI r2, 24
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 0
LDI r6, 251
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
