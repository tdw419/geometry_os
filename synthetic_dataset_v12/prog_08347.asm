; DESCRIPTION: Composite: Sets a single orange pixel at (494, 123) then Creates a white circular shape at (256, 65) with radius 51.
; PLAN: r0=494(x), r1=123(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=256(x), r6=65(y), r7=51(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 494
LDI r1, 123
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 256
LDI r6, 65
LDI r7, 51
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
