; DESCRIPTION: Composite: Places a blue circle of radius 14 at center (43, 43) then Draws a blue rectangle at (222, 27) with width 88 and height 91.
; PLAN: r0=43(x), r1=43(y), r2=14(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=222(x), r6=27(y), r7=88(width), r8=91(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 43
LDI r1, 43
LDI r2, 14
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 222
LDI r6, 27
LDI r7, 88
LDI r8, 91
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
