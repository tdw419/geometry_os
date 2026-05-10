; DESCRIPTION: Composite: Draws a white rectangle at (183, 13) with width 17 and height 88 then Renders a cyan disk with center (147, 76) and radius 60.
; PLAN: r0=183(x), r1=13(y), r2=17(width), r3=88(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=147(x), r6=76(y), r7=60(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 183
LDI r1, 13
LDI r2, 17
LDI r3, 88
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 147
LDI r6, 76
LDI r7, 60
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
