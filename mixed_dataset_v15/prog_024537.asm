; DESCRIPTION: Composite: Creates a orange rectangular region at (337, 157) spanning 56 by 25 pixels then Draws a green circle centered at (66, 183) with radius 65 then Places a green line segment connecting (469, 154) to (454, 181).
; PLAN: r0=337(x), r1=157(y), r2=56(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=66(x), r6=183(y), r7=65(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=469(x1), r11=154(y1), r12=454(x2), r13=181(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 337
LDI r1, 157
LDI r2, 56
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 66
LDI r6, 183
LDI r7, 65
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 469
LDI r11, 154
LDI r12, 454
LDI r13, 181
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
