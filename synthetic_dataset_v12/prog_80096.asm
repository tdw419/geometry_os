; DESCRIPTION: Composite: Creates a blue rectangular region at (262, 28) spanning 41 by 109 pixels then Draws a white circle centered at (414, 132) with radius 54 then Places a red line segment connecting (415, 222) to (506, 60).
; PLAN: r0=262(x), r1=28(y), r2=41(width), r3=109(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=414(x), r6=132(y), r7=54(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=415(x1), r11=222(y1), r12=506(x2), r13=60(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 262
LDI r1, 28
LDI r2, 41
LDI r3, 109
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 414
LDI r6, 132
LDI r7, 54
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 415
LDI r11, 222
LDI r12, 506
LDI r13, 60
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
