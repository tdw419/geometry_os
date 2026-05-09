; DESCRIPTION: Composite: Draws a magenta rectangle at (376, 83) with width 62 and height 85 then Places a red circle of radius 36 at center (83, 123) then Renders a purple line between points (36, 244) and (459, 10).
; PLAN: r0=376(x), r1=83(y), r2=62(width), r3=85(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=83(x), r6=123(y), r7=36(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=36(x1), r11=244(y1), r12=459(x2), r13=10(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 376
LDI r1, 83
LDI r2, 62
LDI r3, 85
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 83
LDI r6, 123
LDI r7, 36
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 36
LDI r11, 244
LDI r12, 459
LDI r13, 10
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
