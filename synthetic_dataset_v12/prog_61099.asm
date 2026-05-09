; DESCRIPTION: Composite: Places a orange dot at position (438, 217) then Draws a red circle centered at (111, 97) with radius 41.
; PLAN: r0=438(x), r1=217(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=111(x), r6=97(y), r7=41(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 438
LDI r1, 217
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 111
LDI r6, 97
LDI r7, 41
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
