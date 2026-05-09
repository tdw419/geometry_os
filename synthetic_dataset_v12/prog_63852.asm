; DESCRIPTION: Composite: Draws a purple rectangle at (187, 56) with width 72 and height 78 then Places a purple circle of radius 11 at center (53, 130) then Renders a yellow line between points (3, 198) and (299, 194).
; PLAN: r0=187(x), r1=56(y), r2=72(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=53(x), r6=130(y), r7=11(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=3(x1), r11=198(y1), r12=299(x2), r13=194(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 187
LDI r1, 56
LDI r2, 72
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 53
LDI r6, 130
LDI r7, 11
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 3
LDI r11, 198
LDI r12, 299
LDI r13, 194
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
