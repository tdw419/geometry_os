; DESCRIPTION: Composite: Draws a blue circle centered at (176, 100) with radius 39 then Draws a black rectangle at (0, 61) with width 15 and height 120 then Draws a black line from (454, 22) to (499, 170).
; PLAN: r0=176(x), r1=100(y), r2=39(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=0(x), r6=61(y), r7=15(width), r8=120(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=454(x1), r11=22(y1), r12=499(x2), r13=170(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 176
LDI r1, 100
LDI r2, 39
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 0
LDI r6, 61
LDI r7, 15
LDI r8, 120
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 454
LDI r11, 22
LDI r12, 499
LDI r13, 170
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
