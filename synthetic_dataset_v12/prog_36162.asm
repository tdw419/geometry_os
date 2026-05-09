; DESCRIPTION: Composite: Creates a white circular shape at (402, 97) with radius 30 then Places a cyan dot at position (201, 53).
; PLAN: r0=402(x), r1=97(y), r2=30(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=201(x), r6=53(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 402
LDI r1, 97
LDI r2, 30
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 201
LDI r6, 53
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
