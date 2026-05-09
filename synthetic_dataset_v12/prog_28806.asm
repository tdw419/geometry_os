; DESCRIPTION: Composite: Draws a magenta circle centered at (189, 207) with radius 42 then Draws a magenta rectangle at (212, 179) with width 72 and height 61 then Draws a blue line from (240, 83) to (128, 12).
; PLAN: r0=189(x), r1=207(y), r2=42(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=212(x), r6=179(y), r7=72(width), r8=61(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=240(x1), r11=83(y1), r12=128(x2), r13=12(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 189
LDI r1, 207
LDI r2, 42
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 212
LDI r6, 179
LDI r7, 72
LDI r8, 61
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 240
LDI r11, 83
LDI r12, 128
LDI r13, 12
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
