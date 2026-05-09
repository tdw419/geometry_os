; DESCRIPTION: Composite: Places a green dot at position (497, 80) then Draws a orange circle centered at (43, 147) with radius 15.
; PLAN: r0=497(x), r1=80(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=43(x), r6=147(y), r7=15(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 497
LDI r1, 80
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 43
LDI r6, 147
LDI r7, 15
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
