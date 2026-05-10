; DESCRIPTION: Composite: Draws a orange circle centered at (165, 79) with radius 18 then Draws a orange rectangle at (122, 157) with width 90 and height 74 then Places a red line segment connecting (203, 116) to (382, 219).
; PLAN: r0=165(x), r1=79(y), r2=18(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=122(x), r6=157(y), r7=90(width), r8=74(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=203(x1), r11=116(y1), r12=382(x2), r13=219(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 165
LDI r1, 79
LDI r2, 18
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 122
LDI r6, 157
LDI r7, 90
LDI r8, 74
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 203
LDI r11, 116
LDI r12, 382
LDI r13, 219
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
