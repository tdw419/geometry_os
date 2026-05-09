; DESCRIPTION: Composite: Sets a single blue pixel at (2, 52) then Draws a blue circle centered at (94, 159) with radius 44.
; PLAN: r0=2(x), r1=52(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=94(x), r6=159(y), r7=44(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 2
LDI r1, 52
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 94
LDI r6, 159
LDI r7, 44
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
