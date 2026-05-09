; DESCRIPTION: Composite: Renders a blue disk with center (274, 58) and radius 39 then Draws a black rectangle at (129, 83) with width 23 and height 52.
; PLAN: r0=274(x), r1=58(y), r2=39(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=129(x), r6=83(y), r7=23(width), r8=52(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 274
LDI r1, 58
LDI r2, 39
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 129
LDI r6, 83
LDI r7, 23
LDI r8, 52
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
