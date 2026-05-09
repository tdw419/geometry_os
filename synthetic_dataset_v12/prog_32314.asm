; DESCRIPTION: Composite: Renders a red line between points (254, 200) and (134, 156) then Creates a black circular shape at (88, 96) with radius 32 then Places a magenta 114x40 rectangle at position (220, 53).
; PLAN: r0=254(x1), r1=200(y1), r2=134(x2), r3=156(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=88(x), r6=96(y), r7=32(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=220(x), r11=53(y), r12=114(width), r13=40(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 254
LDI r1, 200
LDI r2, 134
LDI r3, 156
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 88
LDI r6, 96
LDI r7, 32
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 220
LDI r11, 53
LDI r12, 114
LDI r13, 40
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
