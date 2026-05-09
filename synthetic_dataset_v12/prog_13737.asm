; DESCRIPTION: Composite: Draws a purple circle centered at (120, 144) with radius 57 then Places a black dot at position (498, 141).
; PLAN: r0=120(x), r1=144(y), r2=57(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=498(x), r6=141(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 120
LDI r1, 144
LDI r2, 57
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 498
LDI r6, 141
LDI r7, 0x000000
PSET r5, r6, r7
HALT
