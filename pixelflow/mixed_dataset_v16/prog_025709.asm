; DESCRIPTION: Composite: Places a black line segment connecting (467, 165) to (54, 113) then Creates a white rectangular region at (77, 146) spanning 89 by 79 pixels then Draws a magenta circle centered at (412, 83) with radius 31.
; PLAN: r0=467(x1), r1=165(y1), r2=54(x2), r3=113(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=77(x), r6=146(y), r7=89(width), r8=79(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=412(x), r11=83(y), r12=31(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 467
LDI r1, 165
LDI r2, 54
LDI r3, 113
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 77
LDI r6, 146
LDI r7, 89
LDI r8, 79
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 412
LDI r11, 83
LDI r12, 31
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
