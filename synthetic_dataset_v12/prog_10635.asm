; DESCRIPTION: Composite: Draws a magenta circle centered at (248, 167) with radius 39 then Places a black dot at position (492, 65).
; PLAN: r0=248(x), r1=167(y), r2=39(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=492(x), r6=65(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 248
LDI r1, 167
LDI r2, 39
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 492
LDI r6, 65
LDI r7, 0x000000
PSET r5, r6, r7
HALT
