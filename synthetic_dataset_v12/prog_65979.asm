; DESCRIPTION: Composite: Draws a green rectangle at (287, 49) with width 62 and height 74 then Renders a magenta disk with center (183, 137) and radius 72.
; PLAN: r0=287(x), r1=49(y), r2=62(width), r3=74(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=183(x), r6=137(y), r7=72(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 287
LDI r1, 49
LDI r2, 62
LDI r3, 74
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 183
LDI r6, 137
LDI r7, 72
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
