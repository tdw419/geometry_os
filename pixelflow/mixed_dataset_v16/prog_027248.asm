; DESCRIPTION: Composite: Creates a cyan rectangular region at (280, 174) spanning 101 by 75 pixels then Draws a black circle centered at (347, 147) with radius 74 then Places a red line segment connecting (451, 163) to (409, 102).
; PLAN: r0=280(x), r1=174(y), r2=101(width), r3=75(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=347(x), r6=147(y), r7=74(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=451(x1), r11=163(y1), r12=409(x2), r13=102(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 280
LDI r1, 174
LDI r2, 101
LDI r3, 75
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 347
LDI r6, 147
LDI r7, 74
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 451
LDI r11, 163
LDI r12, 409
LDI r13, 102
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
