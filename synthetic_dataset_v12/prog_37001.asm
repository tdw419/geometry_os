; DESCRIPTION: Composite: Draws a red rectangle at (161, 141) with width 45 and height 104 then Renders a purple line between points (188, 123) and (347, 254) then Places a yellow circle of radius 43 at center (341, 79).
; PLAN: r0=161(x), r1=141(y), r2=45(width), r3=104(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=188(x1), r6=123(y1), r7=347(x2), r8=254(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=341(x), r11=79(y), r12=43(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 161
LDI r1, 141
LDI r2, 45
LDI r3, 104
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 188
LDI r6, 123
LDI r7, 347
LDI r8, 254
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 341
LDI r11, 79
LDI r12, 43
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
