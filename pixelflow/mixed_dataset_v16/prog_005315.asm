; DESCRIPTION: Composite: Creates a magenta rectangular region at (304, 165) spanning 104 by 77 pixels then Renders a black line between points (66, 33) and (452, 248) then Draws a purple circle centered at (237, 172) with radius 70.
; PLAN: r0=304(x), r1=165(y), r2=104(width), r3=77(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=66(x1), r6=33(y1), r7=452(x2), r8=248(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=237(x), r11=172(y), r12=70(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 304
LDI r1, 165
LDI r2, 104
LDI r3, 77
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 66
LDI r6, 33
LDI r7, 452
LDI r8, 248
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 237
LDI r11, 172
LDI r12, 70
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
