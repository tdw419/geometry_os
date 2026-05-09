; DESCRIPTION: Composite: Draws a purple rectangle at (46, 207) with width 17 and height 12 then Renders a purple disk with center (442, 166) and radius 20.
; PLAN: r0=46(x), r1=207(y), r2=17(width), r3=12(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=442(x), r6=166(y), r7=20(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 46
LDI r1, 207
LDI r2, 17
LDI r3, 12
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 442
LDI r6, 166
LDI r7, 20
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
