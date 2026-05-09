; DESCRIPTION: Composite: Sets a single white pixel at (85, 248) then Draws a blue circle centered at (151, 167) with radius 56.
; PLAN: r0=85(x), r1=248(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=151(x), r6=167(y), r7=56(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 85
LDI r1, 248
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 151
LDI r6, 167
LDI r7, 56
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
