; DESCRIPTION: Composite: Creates a magenta circular shape at (91, 56) with radius 37 then Draws a purple rectangle at (308, 43) with width 100 and height 85.
; PLAN: r0=91(x), r1=56(y), r2=37(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=308(x), r6=43(y), r7=100(width), r8=85(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 91
LDI r1, 56
LDI r2, 37
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 308
LDI r6, 43
LDI r7, 100
LDI r8, 85
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
