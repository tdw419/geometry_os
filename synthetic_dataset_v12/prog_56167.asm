; DESCRIPTION: Composite: Sets a single black pixel at (276, 138) then Draws a orange circle centered at (47, 128) with radius 42.
; PLAN: r0=276(x), r1=138(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=47(x), r6=128(y), r7=42(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 276
LDI r1, 138
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 47
LDI r6, 128
LDI r7, 42
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
