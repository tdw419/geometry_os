; DESCRIPTION: Composite: Sets a single purple pixel at (173, 46) then Draws a green circle centered at (64, 172) with radius 47.
; PLAN: r0=173(x), r1=46(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=64(x), r6=172(y), r7=47(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 173
LDI r1, 46
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 64
LDI r6, 172
LDI r7, 47
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
