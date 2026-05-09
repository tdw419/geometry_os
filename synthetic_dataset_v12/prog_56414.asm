; DESCRIPTION: Composite: Draws a cyan circle centered at (367, 143) with radius 58 then Sets a single orange pixel at (315, 245).
; PLAN: r0=367(x), r1=143(y), r2=58(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=315(x), r6=245(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 367
LDI r1, 143
LDI r2, 58
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 315
LDI r6, 245
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
