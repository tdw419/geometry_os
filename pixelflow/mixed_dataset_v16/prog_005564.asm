; DESCRIPTION: Composite: Draws a white circle centered at (349, 139) with radius 75 then Sets a single red pixel at (66, 10).
; PLAN: r0=349(x), r1=139(y), r2=75(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=66(x), r6=10(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 349
LDI r1, 139
LDI r2, 75
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 66
LDI r6, 10
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
