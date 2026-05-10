; DESCRIPTION: Composite: Renders a green box of size 76x62 starting at (43, 23) then Places a blue line segment connecting (272, 101) to (6, 125) then Creates a yellow circular shape at (129, 182) with radius 48.
; PLAN: r0=43(x), r1=23(y), r2=76(width), r3=62(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=272(x1), r6=101(y1), r7=6(x2), r8=125(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=129(x), r11=182(y), r12=48(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 43
LDI r1, 23
LDI r2, 76
LDI r3, 62
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 272
LDI r6, 101
LDI r7, 6
LDI r8, 125
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 129
LDI r11, 182
LDI r12, 48
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
