; DESCRIPTION: Composite: Places a black dot at position (321, 150) then Draws a magenta circle centered at (353, 150) with radius 66.
; PLAN: r0=321(x), r1=150(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=353(x), r6=150(y), r7=66(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 321
LDI r1, 150
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 353
LDI r6, 150
LDI r7, 66
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
