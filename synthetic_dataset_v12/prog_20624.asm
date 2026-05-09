; DESCRIPTION: Composite: Draws a red circle centered at (289, 112) with radius 70 then Creates a red rectangular region at (423, 204) spanning 20 by 23 pixels then Places a green line segment connecting (347, 195) to (332, 78).
; PLAN: r0=289(x), r1=112(y), r2=70(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=423(x), r6=204(y), r7=20(width), r8=23(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=347(x1), r11=195(y1), r12=332(x2), r13=78(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 289
LDI r1, 112
LDI r2, 70
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 423
LDI r6, 204
LDI r7, 20
LDI r8, 23
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 347
LDI r11, 195
LDI r12, 332
LDI r13, 78
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
