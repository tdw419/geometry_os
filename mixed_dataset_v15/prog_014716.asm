; DESCRIPTION: Composite: Places a magenta 104x45 rectangle at position (349, 88) then Draws a green circle centered at (106, 160) with radius 70 then Draws a yellow line from (496, 22) to (255, 140).
; PLAN: r0=349(x), r1=88(y), r2=104(width), r3=45(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=106(x), r6=160(y), r7=70(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=496(x1), r11=22(y1), r12=255(x2), r13=140(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 349
LDI r1, 88
LDI r2, 104
LDI r3, 45
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 106
LDI r6, 160
LDI r7, 70
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 496
LDI r11, 22
LDI r12, 255
LDI r13, 140
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
