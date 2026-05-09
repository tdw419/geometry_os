; DESCRIPTION: Composite: Renders a black disk with center (208, 42) and radius 24 then Creates a black rectangular region at (441, 69) spanning 58 by 92 pixels then Draws a black line from (248, 225) to (35, 201).
; PLAN: r0=208(x), r1=42(y), r2=24(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=441(x), r6=69(y), r7=58(width), r8=92(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=248(x1), r11=225(y1), r12=35(x2), r13=201(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 208
LDI r1, 42
LDI r2, 24
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 441
LDI r6, 69
LDI r7, 58
LDI r8, 92
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 248
LDI r11, 225
LDI r12, 35
LDI r13, 201
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
