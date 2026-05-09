; DESCRIPTION: Composite: Draws a blue circle centered at (372, 92) with radius 76 then Draws a white line from (75, 88) to (244, 41) then Draws a orange rectangle at (280, 142) with width 26 and height 12.
; PLAN: r0=372(x), r1=92(y), r2=76(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=75(x1), r6=88(y1), r7=244(x2), r8=41(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=280(x), r11=142(y), r12=26(width), r13=12(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 372
LDI r1, 92
LDI r2, 76
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 75
LDI r6, 88
LDI r7, 244
LDI r8, 41
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 280
LDI r11, 142
LDI r12, 26
LDI r13, 12
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
