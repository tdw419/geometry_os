; DESCRIPTION: Composite: Sets a single blue pixel at (154, 16) then Draws a purple line from (302, 227) to (38, 181) then Draws a magenta rectangle at (166, 16) with width 96 and height 36.
; PLAN: r0=154(x), r1=16(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=302(x1), r6=227(y1), r7=38(x2), r8=181(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=166(x), r11=16(y), r12=96(width), r13=36(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 154
LDI r1, 16
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 302
LDI r6, 227
LDI r7, 38
LDI r8, 181
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 166
LDI r11, 16
LDI r12, 96
LDI r13, 36
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
