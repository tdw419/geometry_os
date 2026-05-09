; DESCRIPTION: Composite: Creates a blue circular shape at (323, 217) with radius 26 then Draws a green rectangle at (86, 173) with width 65 and height 18.
; PLAN: r0=323(x), r1=217(y), r2=26(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=86(x), r6=173(y), r7=65(width), r8=18(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 323
LDI r1, 217
LDI r2, 26
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 86
LDI r6, 173
LDI r7, 65
LDI r8, 18
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
