; DESCRIPTION: Composite: Draws a black rectangle at (134, 195) with width 32 and height 41 then Creates a blue circular shape at (431, 97) with radius 77 then Draws a magenta line from (99, 116) to (233, 236).
; PLAN: r0=134(x), r1=195(y), r2=32(width), r3=41(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=431(x), r6=97(y), r7=77(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=99(x1), r11=116(y1), r12=233(x2), r13=236(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 134
LDI r1, 195
LDI r2, 32
LDI r3, 41
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 431
LDI r6, 97
LDI r7, 77
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 99
LDI r11, 116
LDI r12, 233
LDI r13, 236
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
