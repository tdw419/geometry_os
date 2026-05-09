; DESCRIPTION: Composite: Renders a green line between points (337, 160) and (89, 88) then Renders a white disk with center (126, 88) and radius 50 then Draws a purple rectangle at (84, 11) with width 47 and height 109.
; PLAN: r0=337(x1), r1=160(y1), r2=89(x2), r3=88(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=126(x), r6=88(y), r7=50(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=84(x), r11=11(y), r12=47(width), r13=109(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 337
LDI r1, 160
LDI r2, 89
LDI r3, 88
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 126
LDI r6, 88
LDI r7, 50
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 84
LDI r11, 11
LDI r12, 47
LDI r13, 109
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
