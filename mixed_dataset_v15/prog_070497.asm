; DESCRIPTION: Composite: Places a purple 78x14 rectangle at position (351, 42) then Creates a green circular shape at (249, 80) with radius 61 then Places a white dot at position (142, 213).
; PLAN: r0=351(x), r1=42(y), r2=78(width), r3=14(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=249(x), r6=80(y), r7=61(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=142(x), r11=213(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 351
LDI r1, 42
LDI r2, 78
LDI r3, 14
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 249
LDI r6, 80
LDI r7, 61
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 142
LDI r11, 213
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
