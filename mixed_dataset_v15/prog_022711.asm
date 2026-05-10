; DESCRIPTION: Composite: Draws a white circle centered at (281, 155) with radius 39 then Renders a green box of size 114x49 starting at (158, 37).
; PLAN: r0=281(x), r1=155(y), r2=39(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=158(x), r6=37(y), r7=114(width), r8=49(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 281
LDI r1, 155
LDI r2, 39
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 158
LDI r6, 37
LDI r7, 114
LDI r8, 49
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
