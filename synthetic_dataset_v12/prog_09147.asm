; DESCRIPTION: Composite: Renders a orange line between points (225, 142) and (155, 153) then Places a green circle of radius 77 at center (170, 110) then Draws a blue rectangle at (309, 108) with width 11 and height 50.
; PLAN: r0=225(x1), r1=142(y1), r2=155(x2), r3=153(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=170(x), r6=110(y), r7=77(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=309(x), r11=108(y), r12=11(width), r13=50(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 225
LDI r1, 142
LDI r2, 155
LDI r3, 153
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 170
LDI r6, 110
LDI r7, 77
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 309
LDI r11, 108
LDI r12, 11
LDI r13, 50
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
