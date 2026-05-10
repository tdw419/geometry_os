; DESCRIPTION: Composite: Creates a green rectangular region at (427, 87) spanning 10 by 31 pixels then Places a purple dot at position (257, 139) then Creates a green circular shape at (413, 215) with radius 14.
; PLAN: r0=427(x), r1=87(y), r2=10(width), r3=31(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=257(x), r6=139(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=413(x), r11=215(y), r12=14(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 427
LDI r1, 87
LDI r2, 10
LDI r3, 31
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 257
LDI r6, 139
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 413
LDI r11, 215
LDI r12, 14
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
