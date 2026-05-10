; DESCRIPTION: Composite: Renders a magenta box of size 57x54 starting at (118, 148) then Renders a white line between points (396, 79) and (334, 161) then Draws a black circle centered at (142, 110) with radius 28.
; PLAN: r0=118(x), r1=148(y), r2=57(width), r3=54(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=396(x1), r6=79(y1), r7=334(x2), r8=161(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=142(x), r11=110(y), r12=28(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 118
LDI r1, 148
LDI r2, 57
LDI r3, 54
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 396
LDI r6, 79
LDI r7, 334
LDI r8, 161
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 142
LDI r11, 110
LDI r12, 28
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
