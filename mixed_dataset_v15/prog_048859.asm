; DESCRIPTION: Composite: Draws a magenta rectangle at (413, 42) with width 68 and height 11 then Renders a blue disk with center (121, 72) and radius 12 then Places a red line segment connecting (283, 175) to (408, 163).
; PLAN: r0=413(x), r1=42(y), r2=68(width), r3=11(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=121(x), r6=72(y), r7=12(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=283(x1), r11=175(y1), r12=408(x2), r13=163(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 413
LDI r1, 42
LDI r2, 68
LDI r3, 11
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 121
LDI r6, 72
LDI r7, 12
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 283
LDI r11, 175
LDI r12, 408
LDI r13, 163
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
