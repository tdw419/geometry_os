; DESCRIPTION: Composite: Sets a single red pixel at (388, 29) then Draws a white circle centered at (249, 78) with radius 62.
; PLAN: r0=388(x), r1=29(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=249(x), r6=78(y), r7=62(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 388
LDI r1, 29
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 249
LDI r6, 78
LDI r7, 62
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
