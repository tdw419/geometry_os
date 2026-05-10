; DESCRIPTION: Composite: Renders a purple line between points (464, 165) and (134, 44) then Draws a magenta rectangle at (409, 215) with width 62 and height 25 then Creates a black circular shape at (118, 118) with radius 23.
; PLAN: r0=464(x1), r1=165(y1), r2=134(x2), r3=44(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=409(x), r6=215(y), r7=62(width), r8=25(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=118(x), r11=118(y), r12=23(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 464
LDI r1, 165
LDI r2, 134
LDI r3, 44
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 409
LDI r6, 215
LDI r7, 62
LDI r8, 25
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 118
LDI r11, 118
LDI r12, 23
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
