; DESCRIPTION: Composite: Creates a black rectangular region at (148, 236) spanning 88 by 17 pixels then Draws a purple circle centered at (325, 96) with radius 50 then Renders a cyan line between points (38, 174) and (498, 235).
; PLAN: r0=148(x), r1=236(y), r2=88(width), r3=17(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=325(x), r6=96(y), r7=50(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=38(x1), r11=174(y1), r12=498(x2), r13=235(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 148
LDI r1, 236
LDI r2, 88
LDI r3, 17
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 325
LDI r6, 96
LDI r7, 50
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 38
LDI r11, 174
LDI r12, 498
LDI r13, 235
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
