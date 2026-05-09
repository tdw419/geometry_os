; DESCRIPTION: Composite: Creates a black circular shape at (222, 157) with radius 62 then Places a magenta 107x55 rectangle at position (399, 157) then Draws a purple line from (423, 71) to (109, 108).
; PLAN: r0=222(x), r1=157(y), r2=62(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=399(x), r6=157(y), r7=107(width), r8=55(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=423(x1), r11=71(y1), r12=109(x2), r13=108(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 222
LDI r1, 157
LDI r2, 62
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 399
LDI r6, 157
LDI r7, 107
LDI r8, 55
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 423
LDI r11, 71
LDI r12, 109
LDI r13, 108
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
