; DESCRIPTION: Composite: Creates a blue circular shape at (257, 196) with radius 31 then Places a purple dot at position (394, 152).
; PLAN: r0=257(x), r1=196(y), r2=31(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=394(x), r6=152(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 257
LDI r1, 196
LDI r2, 31
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 394
LDI r6, 152
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
