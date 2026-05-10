; DESCRIPTION: Composite: Creates a blue rectangular region at (272, 19) spanning 47 by 69 pixels then Creates a white circular shape at (261, 159) with radius 53 then Renders a red line between points (52, 3) and (151, 119).
; PLAN: r0=272(x), r1=19(y), r2=47(width), r3=69(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=261(x), r6=159(y), r7=53(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=52(x1), r11=3(y1), r12=151(x2), r13=119(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 272
LDI r1, 19
LDI r2, 47
LDI r3, 69
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 261
LDI r6, 159
LDI r7, 53
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 52
LDI r11, 3
LDI r12, 151
LDI r13, 119
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
