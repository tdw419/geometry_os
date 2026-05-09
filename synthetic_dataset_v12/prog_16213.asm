; DESCRIPTION: Composite: Renders a white box of size 69x113 starting at (373, 76) then Renders a orange disk with center (296, 138) and radius 55 then Draws a blue line from (25, 118) to (321, 19).
; PLAN: r0=373(x), r1=76(y), r2=69(width), r3=113(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=296(x), r6=138(y), r7=55(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=25(x1), r11=118(y1), r12=321(x2), r13=19(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 373
LDI r1, 76
LDI r2, 69
LDI r3, 113
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 296
LDI r6, 138
LDI r7, 55
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 25
LDI r11, 118
LDI r12, 321
LDI r13, 19
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
