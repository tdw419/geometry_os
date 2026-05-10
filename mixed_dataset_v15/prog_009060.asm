; DESCRIPTION: Composite: Draws a red circle centered at (299, 181) with radius 72 then Places a black line segment connecting (252, 71) to (335, 86) then Creates a magenta rectangular region at (255, 101) spanning 86 by 45 pixels.
; PLAN: r0=299(x), r1=181(y), r2=72(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=252(x1), r6=71(y1), r7=335(x2), r8=86(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=255(x), r11=101(y), r12=86(width), r13=45(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 299
LDI r1, 181
LDI r2, 72
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 252
LDI r6, 71
LDI r7, 335
LDI r8, 86
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 255
LDI r11, 101
LDI r12, 86
LDI r13, 45
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
