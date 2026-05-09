; DESCRIPTION: Composite: Draws a magenta circle centered at (287, 201) with radius 53 then Draws a magenta rectangle at (111, 29) with width 65 and height 43.
; PLAN: r0=287(x), r1=201(y), r2=53(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=111(x), r6=29(y), r7=65(width), r8=43(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 287
LDI r1, 201
LDI r2, 53
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 111
LDI r6, 29
LDI r7, 65
LDI r8, 43
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
