; DESCRIPTION: Composite: Sets a single blue pixel at (265, 179) then Draws a orange circle centered at (425, 115) with radius 66.
; PLAN: r0=265(x), r1=179(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=425(x), r6=115(y), r7=66(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 265
LDI r1, 179
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 425
LDI r6, 115
LDI r7, 66
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
