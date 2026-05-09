; DESCRIPTION: Composite: Draws a green line from (49, 181) to (471, 31) then Creates a white rectangular region at (250, 168) spanning 78 by 54 pixels then Places a magenta circle of radius 73 at center (100, 151).
; PLAN: r0=49(x1), r1=181(y1), r2=471(x2), r3=31(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=250(x), r6=168(y), r7=78(width), r8=54(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=100(x), r11=151(y), r12=73(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 49
LDI r1, 181
LDI r2, 471
LDI r3, 31
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 250
LDI r6, 168
LDI r7, 78
LDI r8, 54
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 100
LDI r11, 151
LDI r12, 73
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
