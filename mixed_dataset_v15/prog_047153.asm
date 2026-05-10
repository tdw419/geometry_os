; DESCRIPTION: Composite: Sets a single black pixel at (319, 209) then Draws a blue circle centered at (373, 172) with radius 19.
; PLAN: r0=319(x), r1=209(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=373(x), r6=172(y), r7=19(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 319
LDI r1, 209
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 373
LDI r6, 172
LDI r7, 19
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
