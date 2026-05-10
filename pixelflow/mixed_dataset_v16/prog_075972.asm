; DESCRIPTION: Composite: Creates a white circular shape at (257, 98) with radius 68 then Draws a magenta rectangle at (158, 221) with width 43 and height 10 then Sets a single black pixel at (268, 144).
; PLAN: r0=257(x), r1=98(y), r2=68(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=158(x), r6=221(y), r7=43(width), r8=10(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=268(x), r11=144(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 257
LDI r1, 98
LDI r2, 68
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 158
LDI r6, 221
LDI r7, 43
LDI r8, 10
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 268
LDI r11, 144
LDI r12, 0x000000
PSET r10, r11, r12
HALT
