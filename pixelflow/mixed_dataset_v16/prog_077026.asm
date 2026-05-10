; DESCRIPTION: Composite: Draws a green rectangle at (14, 122) with width 21 and height 37 then Creates a white circular shape at (429, 76) with radius 61 then Renders a yellow line between points (299, 157) and (178, 238).
; PLAN: r0=14(x), r1=122(y), r2=21(width), r3=37(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=429(x), r6=76(y), r7=61(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=299(x1), r11=157(y1), r12=178(x2), r13=238(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 14
LDI r1, 122
LDI r2, 21
LDI r3, 37
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 429
LDI r6, 76
LDI r7, 61
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 299
LDI r11, 157
LDI r12, 178
LDI r13, 238
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
