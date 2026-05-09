; DESCRIPTION: Composite: Draws a black circle centered at (111, 155) with radius 49 then Renders a white line between points (210, 232) and (85, 177) then Creates a purple rectangular region at (189, 14) spanning 41 by 67 pixels.
; PLAN: r0=111(x), r1=155(y), r2=49(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=210(x1), r6=232(y1), r7=85(x2), r8=177(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=189(x), r11=14(y), r12=41(width), r13=67(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 111
LDI r1, 155
LDI r2, 49
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 210
LDI r6, 232
LDI r7, 85
LDI r8, 177
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 189
LDI r11, 14
LDI r12, 41
LDI r13, 67
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
