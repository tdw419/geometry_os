; DESCRIPTION: Composite: Draws a black rectangle at (313, 198) with width 15 and height 21 then Creates a orange circular shape at (249, 110) with radius 80.
; PLAN: r0=313(x), r1=198(y), r2=15(width), r3=21(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=249(x), r6=110(y), r7=80(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 313
LDI r1, 198
LDI r2, 15
LDI r3, 21
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 249
LDI r6, 110
LDI r7, 80
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
