; DESCRIPTION: Composite: Creates a purple rectangular region at (373, 32) spanning 57 by 43 pixels then Draws a purple line from (432, 14) to (286, 192) then Draws a cyan circle centered at (302, 86) with radius 58.
; PLAN: r0=373(x), r1=32(y), r2=57(width), r3=43(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=432(x1), r6=14(y1), r7=286(x2), r8=192(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=302(x), r11=86(y), r12=58(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 373
LDI r1, 32
LDI r2, 57
LDI r3, 43
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 432
LDI r6, 14
LDI r7, 286
LDI r8, 192
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 302
LDI r11, 86
LDI r12, 58
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
