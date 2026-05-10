; DESCRIPTION: Composite: Sets a single blue pixel at (106, 28) then Draws a magenta circle centered at (478, 191) with radius 15.
; PLAN: r0=106(x), r1=28(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=478(x), r6=191(y), r7=15(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 106
LDI r1, 28
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 478
LDI r6, 191
LDI r7, 15
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
