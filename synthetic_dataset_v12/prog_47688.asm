; DESCRIPTION: Composite: Renders a orange disk with center (358, 119) and radius 37 then Draws a yellow rectangle at (339, 40) with width 18 and height 35.
; PLAN: r0=358(x), r1=119(y), r2=37(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=339(x), r6=40(y), r7=18(width), r8=35(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 358
LDI r1, 119
LDI r2, 37
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 339
LDI r6, 40
LDI r7, 18
LDI r8, 35
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
