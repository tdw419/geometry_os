; DESCRIPTION: Composite: Draws a blue rectangle at (2, 72) with width 88 and height 73 then Creates a orange circular shape at (325, 228) with radius 27 then Places a green line segment connecting (389, 118) to (212, 197).
; PLAN: r0=2(x), r1=72(y), r2=88(width), r3=73(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=325(x), r6=228(y), r7=27(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=389(x1), r11=118(y1), r12=212(x2), r13=197(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 2
LDI r1, 72
LDI r2, 88
LDI r3, 73
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 325
LDI r6, 228
LDI r7, 27
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 389
LDI r11, 118
LDI r12, 212
LDI r13, 197
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
