; DESCRIPTION: Composite: Creates a blue circular shape at (354, 99) with radius 79 then Draws a orange rectangle at (318, 62) with width 100 and height 47.
; PLAN: r0=354(x), r1=99(y), r2=79(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=318(x), r6=62(y), r7=100(width), r8=47(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 354
LDI r1, 99
LDI r2, 79
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 318
LDI r6, 62
LDI r7, 100
LDI r8, 47
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
