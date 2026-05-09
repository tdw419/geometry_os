; DESCRIPTION: Composite: Creates a yellow rectangular region at (232, 141) spanning 22 by 96 pixels then Draws a green circle centered at (411, 216) with radius 38 then Draws a cyan line from (221, 162) to (288, 149).
; PLAN: r0=232(x), r1=141(y), r2=22(width), r3=96(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=411(x), r6=216(y), r7=38(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=221(x1), r11=162(y1), r12=288(x2), r13=149(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 232
LDI r1, 141
LDI r2, 22
LDI r3, 96
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 411
LDI r6, 216
LDI r7, 38
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 221
LDI r11, 162
LDI r12, 288
LDI r13, 149
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
