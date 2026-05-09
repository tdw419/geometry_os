; DESCRIPTION: Composite: Places a blue line segment connecting (12, 138) to (136, 49) then Draws a blue circle centered at (371, 136) with radius 45 then Draws a green rectangle at (243, 81) with width 72 and height 21.
; PLAN: r0=12(x1), r1=138(y1), r2=136(x2), r3=49(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=371(x), r6=136(y), r7=45(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=243(x), r11=81(y), r12=72(width), r13=21(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 12
LDI r1, 138
LDI r2, 136
LDI r3, 49
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 371
LDI r6, 136
LDI r7, 45
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 243
LDI r11, 81
LDI r12, 72
LDI r13, 21
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
