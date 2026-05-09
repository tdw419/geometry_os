; DESCRIPTION: Composite: Creates a black circular shape at (264, 60) with radius 24 then Sets a single orange pixel at (150, 162).
; PLAN: r0=264(x), r1=60(y), r2=24(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=150(x), r6=162(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 264
LDI r1, 60
LDI r2, 24
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 150
LDI r6, 162
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
