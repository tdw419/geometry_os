; DESCRIPTION: Composite: Creates a black rectangular region at (259, 7) spanning 34 by 32 pixels then Places a blue line segment connecting (491, 70) to (110, 239) then Draws a green circle centered at (366, 83) with radius 40.
; PLAN: r0=259(x), r1=7(y), r2=34(width), r3=32(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=491(x1), r6=70(y1), r7=110(x2), r8=239(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=366(x), r11=83(y), r12=40(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 259
LDI r1, 7
LDI r2, 34
LDI r3, 32
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 491
LDI r6, 70
LDI r7, 110
LDI r8, 239
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 366
LDI r11, 83
LDI r12, 40
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
