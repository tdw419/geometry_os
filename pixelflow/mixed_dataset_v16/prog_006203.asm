; DESCRIPTION: Composite: Draws a orange circle centered at (358, 88) with radius 45 then Draws a white rectangle at (93, 29) with width 116 and height 21.
; PLAN: r0=358(x), r1=88(y), r2=45(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=93(x), r6=29(y), r7=116(width), r8=21(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 358
LDI r1, 88
LDI r2, 45
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 93
LDI r6, 29
LDI r7, 116
LDI r8, 21
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
