; DESCRIPTION: Composite: Sets a single yellow pixel at (30, 238) then Draws a magenta circle centered at (278, 104) with radius 78.
; PLAN: r0=30(x), r1=238(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=278(x), r6=104(y), r7=78(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 30
LDI r1, 238
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 278
LDI r6, 104
LDI r7, 78
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
