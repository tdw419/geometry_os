; DESCRIPTION: Composite: . Then Draws a yellow rectangle at (64, 106) with width 11 and height 101. Then Renders a green disk with center (155, 119) and radius 12.
; PLAN: r0=64(x), r1=106(y), r2=11(width), r3=101(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=155(x), r1=119(y), r2=12(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a yellow rectangle at (64, 106) with width 11 and height 101.
; PLAN: r0=64(x), r1=106(y), r2=11(width), r3=101(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 106
LDI r2, 11
LDI r3, 101
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a green disk with center (155, 119) and radius 12.
; PLAN: r0=155(x), r1=119(y), r2=12(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 155
LDI r1, 119
LDI r2, 12
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
