; DESCRIPTION: Composite: Draws a blue rectangle at (221, 117) with width 33 and height 57 then Creates a purple circular shape at (185, 146) with radius 25 then Draws a black line from (14, 3) to (225, 212).
; PLAN: r0=221(x), r1=117(y), r2=33(width), r3=57(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=185(x), r6=146(y), r7=25(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=14(x1), r11=3(y1), r12=225(x2), r13=212(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 221
LDI r1, 117
LDI r2, 33
LDI r3, 57
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 185
LDI r6, 146
LDI r7, 25
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 14
LDI r11, 3
LDI r12, 225
LDI r13, 212
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
