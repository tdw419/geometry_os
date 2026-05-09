; DESCRIPTION: Composite: Creates a yellow rectangular region at (405, 117) spanning 11 by 80 pixels then Draws a black circle centered at (246, 130) with radius 71 then Draws a red line from (136, 45) to (269, 178).
; PLAN: r0=405(x), r1=117(y), r2=11(width), r3=80(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=246(x), r6=130(y), r7=71(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=136(x1), r11=45(y1), r12=269(x2), r13=178(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 405
LDI r1, 117
LDI r2, 11
LDI r3, 80
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 246
LDI r6, 130
LDI r7, 71
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 136
LDI r11, 45
LDI r12, 269
LDI r13, 178
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
