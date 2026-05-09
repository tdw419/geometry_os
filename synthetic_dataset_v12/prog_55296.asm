; DESCRIPTION: Composite: Renders a blue line between points (62, 151) and (468, 175) then Renders a white disk with center (93, 109) and radius 20 then Creates a purple rectangular region at (374, 156) spanning 37 by 97 pixels.
; PLAN: r0=62(x1), r1=151(y1), r2=468(x2), r3=175(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=93(x), r6=109(y), r7=20(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=374(x), r11=156(y), r12=37(width), r13=97(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 62
LDI r1, 151
LDI r2, 468
LDI r3, 175
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 93
LDI r6, 109
LDI r7, 20
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 374
LDI r11, 156
LDI r12, 37
LDI r13, 97
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
