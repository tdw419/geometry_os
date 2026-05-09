; DESCRIPTION: Composite: Places a yellow line segment connecting (204, 136) to (15, 4) then Creates a magenta rectangular region at (272, 149) spanning 48 by 61 pixels then Places a yellow circle of radius 47 at center (179, 202).
; PLAN: r0=204(x1), r1=136(y1), r2=15(x2), r3=4(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=272(x), r6=149(y), r7=48(width), r8=61(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=179(x), r11=202(y), r12=47(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 204
LDI r1, 136
LDI r2, 15
LDI r3, 4
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 272
LDI r6, 149
LDI r7, 48
LDI r8, 61
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 179
LDI r11, 202
LDI r12, 47
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
