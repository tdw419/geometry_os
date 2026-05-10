; DESCRIPTION: Composite: Creates a green circular shape at (110, 102) with radius 57 then Sets a single orange pixel at (283, 173).
; PLAN: r0=110(x), r1=102(y), r2=57(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=283(x), r6=173(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 110
LDI r1, 102
LDI r2, 57
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 283
LDI r6, 173
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
