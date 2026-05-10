; DESCRIPTION: Composite: Draws a purple rectangle at (28, 121) with width 23 and height 113 then Draws a orange circle centered at (43, 19) with radius 12.
; PLAN: r0=28(x), r1=121(y), r2=23(width), r3=113(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=43(x), r6=19(y), r7=12(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 28
LDI r1, 121
LDI r2, 23
LDI r3, 113
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 43
LDI r6, 19
LDI r7, 12
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
