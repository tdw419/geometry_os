; DESCRIPTION: Composite: Places a black 69x102 rectangle at position (116, 34) then Creates a orange circular shape at (248, 157) with radius 75 then Renders a red line between points (441, 234) and (347, 65).
; PLAN: r0=116(x), r1=34(y), r2=69(width), r3=102(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=248(x), r6=157(y), r7=75(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=441(x1), r11=234(y1), r12=347(x2), r13=65(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 116
LDI r1, 34
LDI r2, 69
LDI r3, 102
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 248
LDI r6, 157
LDI r7, 75
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 441
LDI r11, 234
LDI r12, 347
LDI r13, 65
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
