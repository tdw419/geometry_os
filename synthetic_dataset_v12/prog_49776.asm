; DESCRIPTION: Composite: Places a magenta 93x34 rectangle at position (276, 96) then Draws a yellow circle centered at (442, 122) with radius 50 then Draws a green line from (389, 43) to (175, 43).
; PLAN: r0=276(x), r1=96(y), r2=93(width), r3=34(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=442(x), r6=122(y), r7=50(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=389(x1), r11=43(y1), r12=175(x2), r13=43(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 276
LDI r1, 96
LDI r2, 93
LDI r3, 34
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 442
LDI r6, 122
LDI r7, 50
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 389
LDI r11, 43
LDI r12, 175
LDI r13, 43
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
