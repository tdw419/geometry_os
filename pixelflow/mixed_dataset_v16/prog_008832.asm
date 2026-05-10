; DESCRIPTION: Composite: Places a orange line segment connecting (14, 207) to (3, 143) then Creates a white circular shape at (392, 136) with radius 77 then Draws a blue rectangle at (306, 150) with width 99 and height 105.
; PLAN: r0=14(x1), r1=207(y1), r2=3(x2), r3=143(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=392(x), r6=136(y), r7=77(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=306(x), r11=150(y), r12=99(width), r13=105(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 14
LDI r1, 207
LDI r2, 3
LDI r3, 143
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 392
LDI r6, 136
LDI r7, 77
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 306
LDI r11, 150
LDI r12, 99
LDI r13, 105
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
