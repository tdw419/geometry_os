; DESCRIPTION: Composite: Draws a green rectangle at (175, 7) with width 27 and height 72 then Renders a white disk with center (91, 118) and radius 58.
; PLAN: r0=175(x), r1=7(y), r2=27(width), r3=72(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=91(x), r6=118(y), r7=58(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 175
LDI r1, 7
LDI r2, 27
LDI r3, 72
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 91
LDI r6, 118
LDI r7, 58
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
