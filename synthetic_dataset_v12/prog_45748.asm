; DESCRIPTION: Composite: Draws a magenta rectangle at (310, 35) with width 61 and height 71 then Draws a red circle centered at (180, 148) with radius 69.
; PLAN: r0=310(x), r1=35(y), r2=61(width), r3=71(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=180(x), r6=148(y), r7=69(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 310
LDI r1, 35
LDI r2, 61
LDI r3, 71
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 180
LDI r6, 148
LDI r7, 69
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
