; DESCRIPTION: Composite: Renders a orange disk with center (421, 38) and radius 29 then Draws a white rectangle at (435, 64) with width 71 and height 114 then Renders a purple line between points (388, 155) and (234, 231).
; PLAN: r0=421(x), r1=38(y), r2=29(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=435(x), r6=64(y), r7=71(width), r8=114(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=388(x1), r11=155(y1), r12=234(x2), r13=231(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 421
LDI r1, 38
LDI r2, 29
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 435
LDI r6, 64
LDI r7, 71
LDI r8, 114
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 388
LDI r11, 155
LDI r12, 234
LDI r13, 231
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
