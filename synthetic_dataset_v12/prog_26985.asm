; DESCRIPTION: Composite: Draws a black line from (69, 198) to (293, 55) then Draws a white circle centered at (131, 81) with radius 25 then Creates a orange rectangular region at (123, 41) spanning 72 by 38 pixels.
; PLAN: r0=69(x1), r1=198(y1), r2=293(x2), r3=55(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=131(x), r6=81(y), r7=25(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=123(x), r11=41(y), r12=72(width), r13=38(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 69
LDI r1, 198
LDI r2, 293
LDI r3, 55
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 131
LDI r6, 81
LDI r7, 25
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 123
LDI r11, 41
LDI r12, 72
LDI r13, 38
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
