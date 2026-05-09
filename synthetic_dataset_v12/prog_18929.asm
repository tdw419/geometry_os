; DESCRIPTION: Composite: Draws a orange rectangle at (153, 165) with width 84 and height 85 then Creates a purple circular shape at (76, 62) with radius 45.
; PLAN: r0=153(x), r1=165(y), r2=84(width), r3=85(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=76(x), r6=62(y), r7=45(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 153
LDI r1, 165
LDI r2, 84
LDI r3, 85
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 76
LDI r6, 62
LDI r7, 45
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
