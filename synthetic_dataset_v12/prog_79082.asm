; DESCRIPTION: Composite: Draws a orange rectangle at (239, 19) with width 78 and height 96 then Draws a white circle centered at (93, 178) with radius 50.
; PLAN: r0=239(x), r1=19(y), r2=78(width), r3=96(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=93(x), r6=178(y), r7=50(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 239
LDI r1, 19
LDI r2, 78
LDI r3, 96
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 93
LDI r6, 178
LDI r7, 50
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
