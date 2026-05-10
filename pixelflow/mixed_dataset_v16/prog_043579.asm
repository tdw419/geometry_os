; DESCRIPTION: Composite: Draws a yellow rectangle at (127, 177) with width 48 and height 11 then Renders a black disk with center (199, 155) and radius 62.
; PLAN: r0=127(x), r1=177(y), r2=48(width), r3=11(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=199(x), r6=155(y), r7=62(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 127
LDI r1, 177
LDI r2, 48
LDI r3, 11
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 199
LDI r6, 155
LDI r7, 62
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
