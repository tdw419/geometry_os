; DESCRIPTION: Composite: Places a purple line segment connecting (146, 149) to (160, 98) then Draws a yellow circle centered at (425, 117) with radius 74 then Places a magenta 58x28 rectangle at position (302, 198).
; PLAN: r0=146(x1), r1=149(y1), r2=160(x2), r3=98(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=425(x), r6=117(y), r7=74(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=302(x), r11=198(y), r12=58(width), r13=28(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 146
LDI r1, 149
LDI r2, 160
LDI r3, 98
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 425
LDI r6, 117
LDI r7, 74
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 302
LDI r11, 198
LDI r12, 58
LDI r13, 28
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
