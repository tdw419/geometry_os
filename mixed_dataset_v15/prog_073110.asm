; DESCRIPTION: Composite: Renders a purple line between points (104, 227) and (493, 137) then Renders a blue disk with center (320, 190) and radius 66 then Draws a red rectangle at (273, 136) with width 72 and height 17.
; PLAN: r0=104(x1), r1=227(y1), r2=493(x2), r3=137(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=320(x), r6=190(y), r7=66(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=273(x), r11=136(y), r12=72(width), r13=17(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 104
LDI r1, 227
LDI r2, 493
LDI r3, 137
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 320
LDI r6, 190
LDI r7, 66
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 273
LDI r11, 136
LDI r12, 72
LDI r13, 17
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
