; DESCRIPTION: Composite: Draws a green circle centered at (341, 158) with radius 53 then Draws a magenta rectangle at (208, 69) with width 60 and height 119.
; PLAN: r0=341(x), r1=158(y), r2=53(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=208(x), r6=69(y), r7=60(width), r8=119(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 341
LDI r1, 158
LDI r2, 53
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 208
LDI r6, 69
LDI r7, 60
LDI r8, 119
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
