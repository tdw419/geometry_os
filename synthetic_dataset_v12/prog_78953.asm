; DESCRIPTION: Composite: Sets a single blue pixel at (495, 126) then Draws a purple circle centered at (95, 175) with radius 32.
; PLAN: r0=495(x), r1=126(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=95(x), r6=175(y), r7=32(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 495
LDI r1, 126
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 95
LDI r6, 175
LDI r7, 32
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
