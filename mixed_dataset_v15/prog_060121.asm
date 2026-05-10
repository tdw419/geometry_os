; DESCRIPTION: Composite: Creates a green circular shape at (425, 158) with radius 78 then Places a purple dot at position (370, 44).
; PLAN: r0=425(x), r1=158(y), r2=78(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=370(x), r6=44(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 425
LDI r1, 158
LDI r2, 78
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 370
LDI r6, 44
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
