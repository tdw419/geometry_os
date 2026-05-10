; DESCRIPTION: Composite: Places a magenta line segment connecting (144, 247) to (442, 63) then Creates a green rectangular region at (100, 115) spanning 42 by 96 pixels then Creates a blue circular shape at (423, 169) with radius 43.
; PLAN: r0=144(x1), r1=247(y1), r2=442(x2), r3=63(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=100(x), r6=115(y), r7=42(width), r8=96(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=423(x), r11=169(y), r12=43(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 144
LDI r1, 247
LDI r2, 442
LDI r3, 63
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 100
LDI r6, 115
LDI r7, 42
LDI r8, 96
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 423
LDI r11, 169
LDI r12, 43
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
