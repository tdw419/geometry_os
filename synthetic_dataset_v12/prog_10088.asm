; DESCRIPTION: Composite: Draws a green rectangle at (316, 12) with width 68 and height 22 then Renders a red disk with center (416, 86) and radius 70.
; PLAN: r0=316(x), r1=12(y), r2=68(width), r3=22(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=416(x), r6=86(y), r7=70(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 316
LDI r1, 12
LDI r2, 68
LDI r3, 22
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 416
LDI r6, 86
LDI r7, 70
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
