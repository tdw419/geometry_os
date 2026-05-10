; DESCRIPTION: Composite: Creates a orange circular shape at (45, 220) with radius 11 then Sets a single cyan pixel at (259, 203).
; PLAN: r0=45(x), r1=220(y), r2=11(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=259(x), r6=203(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 45
LDI r1, 220
LDI r2, 11
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 259
LDI r6, 203
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
