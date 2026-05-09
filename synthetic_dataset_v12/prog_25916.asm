; DESCRIPTION: Composite: Draws a purple rectangle at (387, 122) with width 58 and height 57 then Renders a black line between points (249, 195) and (145, 244) then Creates a yellow circular shape at (368, 65) with radius 38.
; PLAN: r0=387(x), r1=122(y), r2=58(width), r3=57(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=249(x1), r6=195(y1), r7=145(x2), r8=244(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=368(x), r11=65(y), r12=38(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 387
LDI r1, 122
LDI r2, 58
LDI r3, 57
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 249
LDI r6, 195
LDI r7, 145
LDI r8, 244
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 368
LDI r11, 65
LDI r12, 38
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
