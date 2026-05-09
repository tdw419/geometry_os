; DESCRIPTION: Composite: Draws a blue rectangle at (181, 75) with width 50 and height 56 then Renders a purple line between points (482, 214) and (193, 96) then Draws a green circle centered at (300, 181) with radius 41.
; PLAN: r0=181(x), r1=75(y), r2=50(width), r3=56(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=482(x1), r6=214(y1), r7=193(x2), r8=96(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=300(x), r11=181(y), r12=41(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 181
LDI r1, 75
LDI r2, 50
LDI r3, 56
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 482
LDI r6, 214
LDI r7, 193
LDI r8, 96
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 300
LDI r11, 181
LDI r12, 41
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
