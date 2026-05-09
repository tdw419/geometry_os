; DESCRIPTION: Composite: Renders a white box of size 74x84 starting at (50, 122) then Creates a orange circular shape at (200, 181) with radius 45 then Draws a orange line from (498, 198) to (131, 53).
; PLAN: r0=50(x), r1=122(y), r2=74(width), r3=84(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=200(x), r6=181(y), r7=45(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=498(x1), r11=198(y1), r12=131(x2), r13=53(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 50
LDI r1, 122
LDI r2, 74
LDI r3, 84
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 200
LDI r6, 181
LDI r7, 45
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 498
LDI r11, 198
LDI r12, 131
LDI r13, 53
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
