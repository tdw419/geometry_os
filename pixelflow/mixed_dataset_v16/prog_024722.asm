; DESCRIPTION: Composite: Places a purple 114x93 rectangle at position (150, 154) then Renders a yellow line between points (133, 238) and (227, 178) then Places a black circle of radius 49 at center (366, 132).
; PLAN: r0=150(x), r1=154(y), r2=114(width), r3=93(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=133(x1), r6=238(y1), r7=227(x2), r8=178(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=366(x), r11=132(y), r12=49(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 150
LDI r1, 154
LDI r2, 114
LDI r3, 93
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 133
LDI r6, 238
LDI r7, 227
LDI r8, 178
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 366
LDI r11, 132
LDI r12, 49
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
