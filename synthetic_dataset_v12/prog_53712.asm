; DESCRIPTION: Composite: Renders a yellow line between points (6, 246) and (461, 37) then Draws a cyan circle centered at (155, 21) with radius 17 then Draws a blue rectangle at (198, 14) with width 109 and height 67.
; PLAN: r0=6(x1), r1=246(y1), r2=461(x2), r3=37(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=155(x), r6=21(y), r7=17(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=198(x), r11=14(y), r12=109(width), r13=67(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 6
LDI r1, 246
LDI r2, 461
LDI r3, 37
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 155
LDI r6, 21
LDI r7, 17
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 198
LDI r11, 14
LDI r12, 109
LDI r13, 67
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
