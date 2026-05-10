; DESCRIPTION: Composite: Creates a black circular shape at (226, 196) with radius 11 then Places a white dot at position (179, 150).
; PLAN: r0=226(x), r1=196(y), r2=11(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=179(x), r6=150(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 226
LDI r1, 196
LDI r2, 11
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 179
LDI r6, 150
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
