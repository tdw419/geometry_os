; DESCRIPTION: Composite: Sets a single purple pixel at (75, 62) then Draws a blue circle centered at (43, 102) with radius 16.
; PLAN: r0=75(x), r1=62(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=43(x), r6=102(y), r7=16(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 75
LDI r1, 62
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 43
LDI r6, 102
LDI r7, 16
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
