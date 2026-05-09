; DESCRIPTION: Composite: Sets a single black pixel at (231, 134) then Draws a magenta circle centered at (391, 128) with radius 71.
; PLAN: r0=231(x), r1=134(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=391(x), r6=128(y), r7=71(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 231
LDI r1, 134
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 391
LDI r6, 128
LDI r7, 71
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
