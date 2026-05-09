; DESCRIPTION: Composite: Renders a green disk with center (210, 81) and radius 59 then Draws a blue rectangle at (261, 159) with width 117 and height 11.
; PLAN: r0=210(x), r1=81(y), r2=59(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=261(x), r6=159(y), r7=117(width), r8=11(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 210
LDI r1, 81
LDI r2, 59
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 261
LDI r6, 159
LDI r7, 117
LDI r8, 11
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
