; DESCRIPTION: Composite: Places a red line segment connecting (271, 227) to (34, 160) then Draws a black circle centered at (341, 69) with radius 17 then Places a green 10x79 rectangle at position (291, 155).
; PLAN: r0=271(x1), r1=227(y1), r2=34(x2), r3=160(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=341(x), r6=69(y), r7=17(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=291(x), r11=155(y), r12=10(width), r13=79(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 271
LDI r1, 227
LDI r2, 34
LDI r3, 160
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 341
LDI r6, 69
LDI r7, 17
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 291
LDI r11, 155
LDI r12, 10
LDI r13, 79
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
