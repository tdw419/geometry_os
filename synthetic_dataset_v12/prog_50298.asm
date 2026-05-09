; DESCRIPTION: Composite: Draws a purple rectangle at (102, 23) with width 15 and height 114 then Places a green circle of radius 59 at center (108, 101) then Renders a black line between points (505, 212) and (202, 4).
; PLAN: r0=102(x), r1=23(y), r2=15(width), r3=114(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=108(x), r6=101(y), r7=59(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=505(x1), r11=212(y1), r12=202(x2), r13=4(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 102
LDI r1, 23
LDI r2, 15
LDI r3, 114
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 108
LDI r6, 101
LDI r7, 59
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 505
LDI r11, 212
LDI r12, 202
LDI r13, 4
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
