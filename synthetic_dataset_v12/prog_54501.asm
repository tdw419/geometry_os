; DESCRIPTION: Composite: Draws a blue circle centered at (78, 147) with radius 61 then Renders a orange line between points (166, 192) and (24, 111) then Draws a black rectangle at (154, 121) with width 47 and height 68.
; PLAN: r0=78(x), r1=147(y), r2=61(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=166(x1), r6=192(y1), r7=24(x2), r8=111(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=154(x), r11=121(y), r12=47(width), r13=68(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 78
LDI r1, 147
LDI r2, 61
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 166
LDI r6, 192
LDI r7, 24
LDI r8, 111
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 154
LDI r11, 121
LDI r12, 47
LDI r13, 68
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
