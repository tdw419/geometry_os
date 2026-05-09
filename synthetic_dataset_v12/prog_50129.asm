; DESCRIPTION: Composite: Draws a black circle centered at (263, 97) with radius 58 then Creates a red rectangular region at (294, 102) spanning 17 by 91 pixels then Draws a magenta line from (114, 44) to (287, 159).
; PLAN: r0=263(x), r1=97(y), r2=58(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=294(x), r6=102(y), r7=17(width), r8=91(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=114(x1), r11=44(y1), r12=287(x2), r13=159(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 263
LDI r1, 97
LDI r2, 58
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 294
LDI r6, 102
LDI r7, 17
LDI r8, 91
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 114
LDI r11, 44
LDI r12, 287
LDI r13, 159
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
