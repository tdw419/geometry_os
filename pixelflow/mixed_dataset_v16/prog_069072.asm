; DESCRIPTION: Composite: Renders a blue disk with center (396, 201) and radius 25 then Draws a yellow rectangle at (292, 140) with width 52 and height 62.
; PLAN: r0=396(x), r1=201(y), r2=25(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=292(x), r6=140(y), r7=52(width), r8=62(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 396
LDI r1, 201
LDI r2, 25
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 292
LDI r6, 140
LDI r7, 52
LDI r8, 62
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
