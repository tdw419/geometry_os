; DESCRIPTION: Composite: Draws a white circle centered at (139, 172) with radius 38 then Sets a single orange pixel at (85, 25).
; PLAN: r0=139(x), r1=172(y), r2=38(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=85(x), r6=25(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 139
LDI r1, 172
LDI r2, 38
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 85
LDI r6, 25
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
