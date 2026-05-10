; DESCRIPTION: Composite: Places a red line segment connecting (278, 75) to (221, 206) then Draws a orange circle centered at (63, 148) with radius 53 then Draws a black rectangle at (72, 16) with width 72 and height 22.
; PLAN: r0=278(x1), r1=75(y1), r2=221(x2), r3=206(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=63(x), r6=148(y), r7=53(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=72(x), r11=16(y), r12=72(width), r13=22(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 278
LDI r1, 75
LDI r2, 221
LDI r3, 206
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 63
LDI r6, 148
LDI r7, 53
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 72
LDI r11, 16
LDI r12, 72
LDI r13, 22
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
