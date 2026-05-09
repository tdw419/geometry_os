; DESCRIPTION: Composite: Renders a black line between points (24, 9) and (368, 215) then Draws a red circle centered at (165, 99) with radius 44 then Creates a white rectangular region at (313, 117) spanning 107 by 88 pixels.
; PLAN: r0=24(x1), r1=9(y1), r2=368(x2), r3=215(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=165(x), r6=99(y), r7=44(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=313(x), r11=117(y), r12=107(width), r13=88(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 24
LDI r1, 9
LDI r2, 368
LDI r3, 215
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 165
LDI r6, 99
LDI r7, 44
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 313
LDI r11, 117
LDI r12, 107
LDI r13, 88
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
