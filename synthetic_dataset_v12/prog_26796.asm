; DESCRIPTION: Composite: Renders a blue disk with center (86, 151) and radius 69 then Draws a green line from (139, 230) to (344, 149) then Draws a green rectangle at (469, 86) with width 34 and height 62.
; PLAN: r0=86(x), r1=151(y), r2=69(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=139(x1), r6=230(y1), r7=344(x2), r8=149(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=469(x), r11=86(y), r12=34(width), r13=62(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 86
LDI r1, 151
LDI r2, 69
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 139
LDI r6, 230
LDI r7, 344
LDI r8, 149
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 469
LDI r11, 86
LDI r12, 34
LDI r13, 62
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
