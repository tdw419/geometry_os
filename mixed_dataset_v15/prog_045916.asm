; DESCRIPTION: Composite: Renders a red line between points (451, 159) and (219, 115) then Draws a red rectangle at (437, 165) with width 38 and height 21 then Places a blue circle of radius 80 at center (185, 174).
; PLAN: r0=451(x1), r1=159(y1), r2=219(x2), r3=115(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=437(x), r6=165(y), r7=38(width), r8=21(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=185(x), r11=174(y), r12=80(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 451
LDI r1, 159
LDI r2, 219
LDI r3, 115
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 437
LDI r6, 165
LDI r7, 38
LDI r8, 21
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 185
LDI r11, 174
LDI r12, 80
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
