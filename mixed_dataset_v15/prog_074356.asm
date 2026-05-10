; DESCRIPTION: Composite: Places a green circle of radius 76 at center (421, 115) then Places a purple dot at position (335, 90).
; PLAN: r0=421(x), r1=115(y), r2=76(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=335(x), r6=90(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 421
LDI r1, 115
LDI r2, 76
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 335
LDI r6, 90
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
