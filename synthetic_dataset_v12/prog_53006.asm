; DESCRIPTION: Composite: Draws a black rectangle at (41, 125) with width 17 and height 93 then Creates a black circular shape at (156, 150) with radius 29.
; PLAN: r0=41(x), r1=125(y), r2=17(width), r3=93(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=156(x), r6=150(y), r7=29(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 41
LDI r1, 125
LDI r2, 17
LDI r3, 93
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 156
LDI r6, 150
LDI r7, 29
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
