; DESCRIPTION: Composite: Draws a black rectangle at (230, 73) with width 68 and height 88 then Renders a purple line between points (157, 2) and (444, 137) then Renders a white disk with center (206, 117) and radius 68.
; PLAN: r0=230(x), r1=73(y), r2=68(width), r3=88(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=157(x1), r6=2(y1), r7=444(x2), r8=137(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=206(x), r11=117(y), r12=68(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 230
LDI r1, 73
LDI r2, 68
LDI r3, 88
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 157
LDI r6, 2
LDI r7, 444
LDI r8, 137
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 206
LDI r11, 117
LDI r12, 68
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
