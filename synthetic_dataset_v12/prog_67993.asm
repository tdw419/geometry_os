; DESCRIPTION: Composite: Creates a orange rectangular region at (21, 21) spanning 83 by 96 pixels then Renders a purple line between points (109, 26) and (384, 104) then Creates a cyan circular shape at (88, 197) with radius 54.
; PLAN: r0=21(x), r1=21(y), r2=83(width), r3=96(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=109(x1), r6=26(y1), r7=384(x2), r8=104(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=88(x), r11=197(y), r12=54(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 21
LDI r1, 21
LDI r2, 83
LDI r3, 96
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 109
LDI r6, 26
LDI r7, 384
LDI r8, 104
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 88
LDI r11, 197
LDI r12, 54
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
