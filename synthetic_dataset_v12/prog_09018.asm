; DESCRIPTION: Composite: Draws a yellow rectangle at (125, 154) with width 101 and height 85 then Draws a green circle centered at (391, 171) with radius 49.
; PLAN: r0=125(x), r1=154(y), r2=101(width), r3=85(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=391(x), r6=171(y), r7=49(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 125
LDI r1, 154
LDI r2, 101
LDI r3, 85
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 391
LDI r6, 171
LDI r7, 49
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
