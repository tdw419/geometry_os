; DESCRIPTION: Composite: Renders a green disk with center (468, 210) and radius 23 then Draws a purple rectangle at (187, 15) with width 76 and height 39 then Renders a yellow line between points (311, 108) and (163, 218).
; PLAN: r0=468(x), r1=210(y), r2=23(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=187(x), r6=15(y), r7=76(width), r8=39(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=311(x1), r11=108(y1), r12=163(x2), r13=218(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 468
LDI r1, 210
LDI r2, 23
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 187
LDI r6, 15
LDI r7, 76
LDI r8, 39
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 311
LDI r11, 108
LDI r12, 163
LDI r13, 218
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
