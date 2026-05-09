; DESCRIPTION: Composite: Draws a yellow rectangle at (0, 99) with width 110 and height 55 then Places a black line segment connecting (265, 181) to (60, 69) then Draws a blue circle centered at (450, 207) with radius 38.
; PLAN: r0=0(x), r1=99(y), r2=110(width), r3=55(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=265(x1), r6=181(y1), r7=60(x2), r8=69(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=450(x), r11=207(y), r12=38(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 0
LDI r1, 99
LDI r2, 110
LDI r3, 55
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 265
LDI r6, 181
LDI r7, 60
LDI r8, 69
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 450
LDI r11, 207
LDI r12, 38
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
