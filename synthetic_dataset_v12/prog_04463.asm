; DESCRIPTION: Composite: Sets a single blue pixel at (447, 11) then Draws a black circle centered at (288, 107) with radius 54.
; PLAN: r0=447(x), r1=11(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=288(x), r6=107(y), r7=54(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 447
LDI r1, 11
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 288
LDI r6, 107
LDI r7, 54
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
