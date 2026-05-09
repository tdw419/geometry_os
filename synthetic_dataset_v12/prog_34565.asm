; DESCRIPTION: Composite: Places a yellow line segment connecting (267, 81) to (247, 218) then Draws a orange circle centered at (248, 219) with radius 22 then Renders a purple box of size 67x36 starting at (250, 149).
; PLAN: r0=267(x1), r1=81(y1), r2=247(x2), r3=218(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=248(x), r6=219(y), r7=22(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=250(x), r11=149(y), r12=67(width), r13=36(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 267
LDI r1, 81
LDI r2, 247
LDI r3, 218
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 248
LDI r6, 219
LDI r7, 22
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 250
LDI r11, 149
LDI r12, 67
LDI r13, 36
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
