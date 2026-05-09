; DESCRIPTION: Composite: Draws a blue rectangle at (49, 105) with width 75 and height 66 then Creates a red circular shape at (258, 165) with radius 30.
; PLAN: r0=49(x), r1=105(y), r2=75(width), r3=66(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=258(x), r6=165(y), r7=30(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 49
LDI r1, 105
LDI r2, 75
LDI r3, 66
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 258
LDI r6, 165
LDI r7, 30
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
