; DESCRIPTION: Composite: Renders a magenta line between points (91, 153) and (352, 32) then Creates a blue rectangular region at (319, 178) spanning 40 by 56 pixels then Draws a yellow circle centered at (184, 181) with radius 72.
; PLAN: r0=91(x1), r1=153(y1), r2=352(x2), r3=32(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=319(x), r6=178(y), r7=40(width), r8=56(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=184(x), r11=181(y), r12=72(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 91
LDI r1, 153
LDI r2, 352
LDI r3, 32
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 319
LDI r6, 178
LDI r7, 40
LDI r8, 56
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 184
LDI r11, 181
LDI r12, 72
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
