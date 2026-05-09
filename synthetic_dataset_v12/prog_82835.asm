; DESCRIPTION: Composite: Draws a black line from (319, 227) to (80, 132) then Creates a purple rectangular region at (247, 86) spanning 85 by 73 pixels then Creates a magenta circular shape at (196, 108) with radius 73.
; PLAN: r0=319(x1), r1=227(y1), r2=80(x2), r3=132(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=247(x), r6=86(y), r7=85(width), r8=73(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=196(x), r11=108(y), r12=73(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 319
LDI r1, 227
LDI r2, 80
LDI r3, 132
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 247
LDI r6, 86
LDI r7, 85
LDI r8, 73
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 196
LDI r11, 108
LDI r12, 73
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
