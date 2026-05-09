; DESCRIPTION: Composite: Draws a yellow circle centered at (156, 64) with radius 50 then Draws a orange rectangle at (53, 8) with width 111 and height 22 then Draws a yellow line from (116, 166) to (22, 189).
; PLAN: r0=156(x), r1=64(y), r2=50(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=53(x), r6=8(y), r7=111(width), r8=22(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=116(x1), r11=166(y1), r12=22(x2), r13=189(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 156
LDI r1, 64
LDI r2, 50
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 53
LDI r6, 8
LDI r7, 111
LDI r8, 22
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 116
LDI r11, 166
LDI r12, 22
LDI r13, 189
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
