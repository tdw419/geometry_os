; DESCRIPTION: Composite: Creates a green circular shape at (190, 123) with radius 63 then Draws a blue rectangle at (147, 149) with width 69 and height 101.
; PLAN: r0=190(x), r1=123(y), r2=63(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=147(x), r6=149(y), r7=69(width), r8=101(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 190
LDI r1, 123
LDI r2, 63
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 147
LDI r6, 149
LDI r7, 69
LDI r8, 101
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
