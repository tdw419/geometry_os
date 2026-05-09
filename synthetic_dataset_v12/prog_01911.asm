; DESCRIPTION: Composite: Creates a black circular shape at (195, 56) with radius 42 then Draws a purple rectangle at (411, 160) with width 49 and height 75.
; PLAN: r0=195(x), r1=56(y), r2=42(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=411(x), r6=160(y), r7=49(width), r8=75(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 195
LDI r1, 56
LDI r2, 42
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 411
LDI r6, 160
LDI r7, 49
LDI r8, 75
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
