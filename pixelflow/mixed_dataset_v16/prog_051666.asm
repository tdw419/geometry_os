; DESCRIPTION: Composite: Draws a white rectangle at (68, 101) with width 106 and height 71 then Places a magenta circle of radius 61 at center (199, 156) then Places a yellow line segment connecting (278, 228) to (390, 48).
; PLAN: r0=68(x), r1=101(y), r2=106(width), r3=71(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=199(x), r6=156(y), r7=61(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=278(x1), r11=228(y1), r12=390(x2), r13=48(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 68
LDI r1, 101
LDI r2, 106
LDI r3, 71
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 199
LDI r6, 156
LDI r7, 61
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 278
LDI r11, 228
LDI r12, 390
LDI r13, 48
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
