; DESCRIPTION: Composite: Places a black dot at position (447, 119) then Places a black line segment connecting (364, 2) to (359, 88) then Draws a green rectangle at (165, 175) with width 61 and height 41.
; PLAN: r0=447(x), r1=119(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=364(x1), r6=2(y1), r7=359(x2), r8=88(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=165(x), r11=175(y), r12=61(width), r13=41(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 447
LDI r1, 119
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 364
LDI r6, 2
LDI r7, 359
LDI r8, 88
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 165
LDI r11, 175
LDI r12, 61
LDI r13, 41
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
