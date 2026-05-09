; DESCRIPTION: Composite: Draws a blue rectangle at (111, 115) with width 84 and height 22 then Creates a white circular shape at (52, 58) with radius 15.
; PLAN: r0=111(x), r1=115(y), r2=84(width), r3=22(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=52(x), r6=58(y), r7=15(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 111
LDI r1, 115
LDI r2, 84
LDI r3, 22
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 52
LDI r6, 58
LDI r7, 15
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
