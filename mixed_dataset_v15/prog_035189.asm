; DESCRIPTION: Composite: Draws a black rectangle at (139, 84) with width 106 and height 59 then Places a black circle of radius 26 at center (345, 202) then Renders a blue line between points (360, 140) and (484, 101).
; PLAN: r0=139(x), r1=84(y), r2=106(width), r3=59(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=345(x), r6=202(y), r7=26(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=360(x1), r11=140(y1), r12=484(x2), r13=101(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 139
LDI r1, 84
LDI r2, 106
LDI r3, 59
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 345
LDI r6, 202
LDI r7, 26
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 360
LDI r11, 140
LDI r12, 484
LDI r13, 101
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
