; DESCRIPTION: Composite: Creates a green circular shape at (101, 137) with radius 56 then Sets a single cyan pixel at (332, 29).
; PLAN: r0=101(x), r1=137(y), r2=56(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=332(x), r6=29(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 101
LDI r1, 137
LDI r2, 56
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 332
LDI r6, 29
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
