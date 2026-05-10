; DESCRIPTION: Composite: Renders a black line between points (306, 246) and (492, 169) then Renders a blue disk with center (431, 157) and radius 76 then Draws a white rectangle at (107, 112) with width 95 and height 33.
; PLAN: r0=306(x1), r1=246(y1), r2=492(x2), r3=169(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=431(x), r6=157(y), r7=76(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=107(x), r11=112(y), r12=95(width), r13=33(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 306
LDI r1, 246
LDI r2, 492
LDI r3, 169
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 431
LDI r6, 157
LDI r7, 76
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 107
LDI r11, 112
LDI r12, 95
LDI r13, 33
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
