; DESCRIPTION: Composite: Draws a white line from (103, 193) to (276, 172) then Draws a black rectangle at (16, 124) with width 15 and height 78 then Draws a white circle centered at (364, 118) with radius 26.
; PLAN: r0=103(x1), r1=193(y1), r2=276(x2), r3=172(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=16(x), r6=124(y), r7=15(width), r8=78(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=364(x), r11=118(y), r12=26(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 103
LDI r1, 193
LDI r2, 276
LDI r3, 172
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 16
LDI r6, 124
LDI r7, 15
LDI r8, 78
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 364
LDI r11, 118
LDI r12, 26
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
