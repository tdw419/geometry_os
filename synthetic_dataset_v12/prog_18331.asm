; DESCRIPTION: Composite: Creates a white circular shape at (364, 102) with radius 36 then Sets a single orange pixel at (146, 1).
; PLAN: r0=364(x), r1=102(y), r2=36(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=146(x), r6=1(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 364
LDI r1, 102
LDI r2, 36
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 146
LDI r6, 1
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
