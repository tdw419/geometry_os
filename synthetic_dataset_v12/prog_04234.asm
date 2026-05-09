; DESCRIPTION: Composite: Creates a blue circular shape at (404, 140) with radius 73 then Draws a green rectangle at (302, 35) with width 91 and height 40.
; PLAN: r0=404(x), r1=140(y), r2=73(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=302(x), r6=35(y), r7=91(width), r8=40(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 404
LDI r1, 140
LDI r2, 73
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 302
LDI r6, 35
LDI r7, 91
LDI r8, 40
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
