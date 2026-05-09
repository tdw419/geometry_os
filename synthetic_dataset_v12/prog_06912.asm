; DESCRIPTION: Composite: Draws a red line from (72, 102) to (373, 164) then Creates a green circular shape at (175, 171) with radius 36 then Creates a black rectangular region at (42, 101) spanning 13 by 26 pixels.
; PLAN: r0=72(x1), r1=102(y1), r2=373(x2), r3=164(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=175(x), r6=171(y), r7=36(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=42(x), r11=101(y), r12=13(width), r13=26(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 72
LDI r1, 102
LDI r2, 373
LDI r3, 164
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 175
LDI r6, 171
LDI r7, 36
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 42
LDI r11, 101
LDI r12, 13
LDI r13, 26
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
