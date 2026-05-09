; DESCRIPTION: Composite: Renders a magenta line between points (2, 81) and (436, 239) then Draws a purple circle centered at (290, 86) with radius 78 then Creates a white rectangular region at (296, 174) spanning 34 by 12 pixels.
; PLAN: r0=2(x1), r1=81(y1), r2=436(x2), r3=239(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=290(x), r6=86(y), r7=78(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=296(x), r11=174(y), r12=34(width), r13=12(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 2
LDI r1, 81
LDI r2, 436
LDI r3, 239
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 290
LDI r6, 86
LDI r7, 78
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 296
LDI r11, 174
LDI r12, 34
LDI r13, 12
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
