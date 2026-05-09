; DESCRIPTION: Composite: Places a magenta 11x97 rectangle at position (192, 40) then Renders a green line between points (203, 91) and (222, 60) then Renders a yellow disk with center (276, 148) and radius 43.
; PLAN: r0=192(x), r1=40(y), r2=11(width), r3=97(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=203(x1), r6=91(y1), r7=222(x2), r8=60(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=276(x), r11=148(y), r12=43(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 192
LDI r1, 40
LDI r2, 11
LDI r3, 97
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 203
LDI r6, 91
LDI r7, 222
LDI r8, 60
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 276
LDI r11, 148
LDI r12, 43
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
