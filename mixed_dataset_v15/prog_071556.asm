; DESCRIPTION: Composite: Draws a black circle centered at (480, 115) with radius 14 then Draws a yellow rectangle at (225, 1) with width 84 and height 50 then Draws a blue line from (248, 179) to (143, 47).
; PLAN: r0=480(x), r1=115(y), r2=14(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=225(x), r6=1(y), r7=84(width), r8=50(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=248(x1), r11=179(y1), r12=143(x2), r13=47(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 480
LDI r1, 115
LDI r2, 14
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 225
LDI r6, 1
LDI r7, 84
LDI r8, 50
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 248
LDI r11, 179
LDI r12, 143
LDI r13, 47
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
