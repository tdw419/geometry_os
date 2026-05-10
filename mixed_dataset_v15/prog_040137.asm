; DESCRIPTION: Composite: Creates a magenta rectangular region at (393, 118) spanning 40 by 54 pixels then Renders a green line between points (211, 181) and (384, 78) then Draws a white circle centered at (476, 48) with radius 26.
; PLAN: r0=393(x), r1=118(y), r2=40(width), r3=54(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=211(x1), r6=181(y1), r7=384(x2), r8=78(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=476(x), r11=48(y), r12=26(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 393
LDI r1, 118
LDI r2, 40
LDI r3, 54
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 211
LDI r6, 181
LDI r7, 384
LDI r8, 78
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 476
LDI r11, 48
LDI r12, 26
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
