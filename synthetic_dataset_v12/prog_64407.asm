; DESCRIPTION: Composite: Sets a single orange pixel at (212, 113) then Draws a white circle centered at (352, 147) with radius 49.
; PLAN: r0=212(x), r1=113(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=352(x), r6=147(y), r7=49(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 212
LDI r1, 113
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 352
LDI r6, 147
LDI r7, 49
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
