; DESCRIPTION: Composite: Draws a green circle centered at (268, 63) with radius 61 then Draws a green rectangle at (167, 5) with width 34 and height 114 then Draws a green line from (136, 118) to (287, 20).
; PLAN: r0=268(x), r1=63(y), r2=61(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=167(x), r6=5(y), r7=34(width), r8=114(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=136(x1), r11=118(y1), r12=287(x2), r13=20(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 268
LDI r1, 63
LDI r2, 61
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 167
LDI r6, 5
LDI r7, 34
LDI r8, 114
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 136
LDI r11, 118
LDI r12, 287
LDI r13, 20
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
