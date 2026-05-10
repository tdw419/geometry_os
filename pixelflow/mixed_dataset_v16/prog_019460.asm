; DESCRIPTION: Composite: Creates a black circular shape at (211, 167) with radius 72 then Draws a blue rectangle at (376, 187) with width 41 and height 34 then Draws a magenta line from (52, 37) to (117, 75).
; PLAN: r0=211(x), r1=167(y), r2=72(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=376(x), r6=187(y), r7=41(width), r8=34(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=52(x1), r11=37(y1), r12=117(x2), r13=75(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 211
LDI r1, 167
LDI r2, 72
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 376
LDI r6, 187
LDI r7, 41
LDI r8, 34
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 52
LDI r11, 37
LDI r12, 117
LDI r13, 75
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
