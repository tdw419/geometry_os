; DESCRIPTION: Composite: Creates a yellow circular shape at (155, 176) with radius 24 then Places a red line segment connecting (181, 70) to (192, 197) then Creates a green rectangular region at (137, 182) spanning 71 by 48 pixels.
; PLAN: r0=155(x), r1=176(y), r2=24(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=181(x1), r6=70(y1), r7=192(x2), r8=197(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=137(x), r11=182(y), r12=71(width), r13=48(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 155
LDI r1, 176
LDI r2, 24
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 181
LDI r6, 70
LDI r7, 192
LDI r8, 197
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 137
LDI r11, 182
LDI r12, 71
LDI r13, 48
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
