; DESCRIPTION: Composite: Draws a black circle centered at (167, 106) with radius 75 then Sets a single purple pixel at (350, 232).
; PLAN: r0=167(x), r1=106(y), r2=75(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=350(x), r6=232(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 167
LDI r1, 106
LDI r2, 75
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 350
LDI r6, 232
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
