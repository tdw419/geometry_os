; DESCRIPTION: Composite: Renders a red disk with center (335, 96) and radius 43 then Creates a black rectangular region at (327, 89) spanning 49 by 40 pixels then Draws a magenta line from (153, 36) to (439, 222).
; PLAN: r0=335(x), r1=96(y), r2=43(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=327(x), r6=89(y), r7=49(width), r8=40(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=153(x1), r11=36(y1), r12=439(x2), r13=222(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 335
LDI r1, 96
LDI r2, 43
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 327
LDI r6, 89
LDI r7, 49
LDI r8, 40
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 153
LDI r11, 36
LDI r12, 439
LDI r13, 222
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
