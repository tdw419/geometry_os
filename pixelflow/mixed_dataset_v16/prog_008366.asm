; DESCRIPTION: Composite: Creates a blue circular shape at (373, 102) with radius 47 then Sets a single orange pixel at (442, 13).
; PLAN: r0=373(x), r1=102(y), r2=47(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=442(x), r6=13(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 373
LDI r1, 102
LDI r2, 47
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 442
LDI r6, 13
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
