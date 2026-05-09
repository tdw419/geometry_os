; DESCRIPTION: Composite: Places a green line segment connecting (470, 49) to (149, 210) then Creates a magenta rectangular region at (163, 2) spanning 113 by 71 pixels then Draws a yellow circle centered at (309, 128) with radius 48.
; PLAN: r0=470(x1), r1=49(y1), r2=149(x2), r3=210(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=163(x), r6=2(y), r7=113(width), r8=71(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=309(x), r11=128(y), r12=48(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 470
LDI r1, 49
LDI r2, 149
LDI r3, 210
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 163
LDI r6, 2
LDI r7, 113
LDI r8, 71
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 309
LDI r11, 128
LDI r12, 48
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
