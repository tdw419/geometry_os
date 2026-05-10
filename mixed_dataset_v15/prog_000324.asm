; DESCRIPTION: Composite: Places a black circle of radius 62 at center (302, 165) then Draws a black rectangle at (154, 147) with width 34 and height 84.
; PLAN: r0=302(x), r1=165(y), r2=62(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=154(x), r6=147(y), r7=34(width), r8=84(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 302
LDI r1, 165
LDI r2, 62
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 154
LDI r6, 147
LDI r7, 34
LDI r8, 84
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
