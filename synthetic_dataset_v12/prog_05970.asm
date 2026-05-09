; DESCRIPTION: Composite: Renders a green disk with center (375, 211) and radius 40 then Sets a single orange pixel at (438, 23).
; PLAN: r0=375(x), r1=211(y), r2=40(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=438(x), r6=23(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 375
LDI r1, 211
LDI r2, 40
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 438
LDI r6, 23
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
