; DESCRIPTION: Composite: Draws a green rectangle at (49, 204) with width 69 and height 17 then Places a magenta line segment connecting (158, 178) to (276, 170).
; PLAN: r0=49(x), r1=204(y), r2=69(width), r3=17(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=158(x1), r6=178(y1), r7=276(x2), r8=170(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 49
LDI r1, 204
LDI r2, 69
LDI r3, 17
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 158
LDI r6, 178
LDI r7, 276
LDI r8, 170
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
