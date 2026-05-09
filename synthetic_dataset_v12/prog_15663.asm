; DESCRIPTION: Composite: Creates a yellow circular shape at (290, 132) with radius 67 then Draws a white rectangle at (118, 166) with width 94 and height 26.
; PLAN: r0=290(x), r1=132(y), r2=67(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=118(x), r6=166(y), r7=94(width), r8=26(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 290
LDI r1, 132
LDI r2, 67
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 118
LDI r6, 166
LDI r7, 94
LDI r8, 26
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
