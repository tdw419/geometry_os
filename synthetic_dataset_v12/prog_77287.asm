; DESCRIPTION: Composite: Places a black 44x94 rectangle at position (403, 106) then Renders a yellow line between points (459, 198) and (314, 104) then Draws a magenta circle centered at (322, 158) with radius 76.
; PLAN: r0=403(x), r1=106(y), r2=44(width), r3=94(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=459(x1), r6=198(y1), r7=314(x2), r8=104(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=322(x), r11=158(y), r12=76(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 403
LDI r1, 106
LDI r2, 44
LDI r3, 94
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 459
LDI r6, 198
LDI r7, 314
LDI r8, 104
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 322
LDI r11, 158
LDI r12, 76
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
