; DESCRIPTION: Composite: Renders a blue box of size 86x10 starting at (266, 156) then Creates a orange circular shape at (490, 147) with radius 11.
; PLAN: r0=266(x), r1=156(y), r2=86(width), r3=10(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=490(x), r6=147(y), r7=11(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 266
LDI r1, 156
LDI r2, 86
LDI r3, 10
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 490
LDI r6, 147
LDI r7, 11
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
