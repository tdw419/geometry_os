; DESCRIPTION: Composite: Draws a orange circle centered at (172, 97) with radius 66 then Renders a white box of size 10x42 starting at (272, 126).
; PLAN: r0=172(x), r1=97(y), r2=66(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=272(x), r6=126(y), r7=10(width), r8=42(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 172
LDI r1, 97
LDI r2, 66
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 272
LDI r6, 126
LDI r7, 10
LDI r8, 42
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
