; DESCRIPTION: Composite: Creates a orange circular shape at (274, 201) with radius 52 then Draws a white rectangle at (153, 50) with width 52 and height 57 then Places a black dot at position (94, 195).
; PLAN: r0=274(x), r1=201(y), r2=52(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=153(x), r6=50(y), r7=52(width), r8=57(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=94(x), r11=195(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 274
LDI r1, 201
LDI r2, 52
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 153
LDI r6, 50
LDI r7, 52
LDI r8, 57
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 94
LDI r11, 195
LDI r12, 0x000000
PSET r10, r11, r12
HALT
