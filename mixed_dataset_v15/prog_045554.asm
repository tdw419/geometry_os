; DESCRIPTION: Composite: Places a purple circle of radius 37 at center (144, 78) then Sets a single green pixel at (434, 137).
; PLAN: r0=144(x), r1=78(y), r2=37(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=434(x), r6=137(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 144
LDI r1, 78
LDI r2, 37
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 434
LDI r6, 137
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
