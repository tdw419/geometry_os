; DESCRIPTION: Composite: Draws a purple rectangle at (396, 6) with width 100 and height 44 then Renders a magenta disk with center (368, 173) and radius 61 then Renders a purple line between points (509, 184) and (451, 215).
; PLAN: r0=396(x), r1=6(y), r2=100(width), r3=44(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=368(x), r6=173(y), r7=61(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=509(x1), r11=184(y1), r12=451(x2), r13=215(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 396
LDI r1, 6
LDI r2, 100
LDI r3, 44
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 368
LDI r6, 173
LDI r7, 61
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 509
LDI r11, 184
LDI r12, 451
LDI r13, 215
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
