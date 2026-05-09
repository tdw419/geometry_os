; DESCRIPTION: Composite: Draws a red rectangle at (122, 126) with width 60 and height 86 then Draws a black circle centered at (311, 154) with radius 55.
; PLAN: r0=122(x), r1=126(y), r2=60(width), r3=86(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=311(x), r6=154(y), r7=55(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 122
LDI r1, 126
LDI r2, 60
LDI r3, 86
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 311
LDI r6, 154
LDI r7, 55
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
