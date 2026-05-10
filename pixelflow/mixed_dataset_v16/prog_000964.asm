; DESCRIPTION: Composite: Renders a black box of size 29x54 starting at (438, 131) then Draws a green circle centered at (147, 139) with radius 50.
; PLAN: r0=438(x), r1=131(y), r2=29(width), r3=54(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=147(x), r6=139(y), r7=50(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 438
LDI r1, 131
LDI r2, 29
LDI r3, 54
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 147
LDI r6, 139
LDI r7, 50
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
