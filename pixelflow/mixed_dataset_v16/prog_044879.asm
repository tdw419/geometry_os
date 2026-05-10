; DESCRIPTION: Composite: Renders a yellow box of size 97x89 starting at (62, 84) then Renders a green disk with center (250, 206) and radius 27 then Draws a black line from (285, 118) to (214, 235).
; PLAN: r0=62(x), r1=84(y), r2=97(width), r3=89(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=250(x), r6=206(y), r7=27(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=285(x1), r11=118(y1), r12=214(x2), r13=235(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 62
LDI r1, 84
LDI r2, 97
LDI r3, 89
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 250
LDI r6, 206
LDI r7, 27
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 285
LDI r11, 118
LDI r12, 214
LDI r13, 235
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
