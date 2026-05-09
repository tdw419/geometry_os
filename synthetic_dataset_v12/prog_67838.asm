; DESCRIPTION: Composite: Draws a blue circle centered at (211, 195) with radius 34 then Places a black 42x65 rectangle at position (49, 9).
; PLAN: r0=211(x), r1=195(y), r2=34(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=49(x), r6=9(y), r7=42(width), r8=65(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 211
LDI r1, 195
LDI r2, 34
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 49
LDI r6, 9
LDI r7, 42
LDI r8, 65
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
