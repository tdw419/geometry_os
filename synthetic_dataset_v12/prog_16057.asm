; DESCRIPTION: Composite: Draws a red line from (166, 78) to (414, 34) then Renders a magenta disk with center (183, 128) and radius 72 then Creates a yellow rectangular region at (370, 143) spanning 33 by 60 pixels.
; PLAN: r0=166(x1), r1=78(y1), r2=414(x2), r3=34(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=183(x), r6=128(y), r7=72(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=370(x), r11=143(y), r12=33(width), r13=60(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 166
LDI r1, 78
LDI r2, 414
LDI r3, 34
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 183
LDI r6, 128
LDI r7, 72
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 370
LDI r11, 143
LDI r12, 33
LDI r13, 60
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
