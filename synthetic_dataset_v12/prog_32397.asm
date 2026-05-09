; DESCRIPTION: Composite: Draws a blue rectangle at (120, 113) with width 97 and height 118 then Creates a white circular shape at (156, 40) with radius 15.
; PLAN: r0=120(x), r1=113(y), r2=97(width), r3=118(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=156(x), r6=40(y), r7=15(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 120
LDI r1, 113
LDI r2, 97
LDI r3, 118
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 156
LDI r6, 40
LDI r7, 15
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
