; DESCRIPTION: Composite: Renders a orange box of size 32x73 starting at (185, 177) then Creates a red circular shape at (353, 107) with radius 48 then Draws a blue line from (88, 3) to (318, 136).
; PLAN: r0=185(x), r1=177(y), r2=32(width), r3=73(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=353(x), r6=107(y), r7=48(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=88(x1), r11=3(y1), r12=318(x2), r13=136(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 185
LDI r1, 177
LDI r2, 32
LDI r3, 73
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 353
LDI r6, 107
LDI r7, 48
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 88
LDI r11, 3
LDI r12, 318
LDI r13, 136
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
