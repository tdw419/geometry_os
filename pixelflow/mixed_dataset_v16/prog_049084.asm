; DESCRIPTION: Composite: Renders a black line between points (244, 96) and (74, 144) then Creates a blue rectangular region at (289, 61) spanning 116 by 34 pixels then Renders a black disk with center (278, 184) and radius 30.
; PLAN: r0=244(x1), r1=96(y1), r2=74(x2), r3=144(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=289(x), r6=61(y), r7=116(width), r8=34(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=278(x), r11=184(y), r12=30(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 244
LDI r1, 96
LDI r2, 74
LDI r3, 144
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 289
LDI r6, 61
LDI r7, 116
LDI r8, 34
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 278
LDI r11, 184
LDI r12, 30
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
