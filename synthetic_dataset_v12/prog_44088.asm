; DESCRIPTION: Composite: Places a yellow line segment connecting (43, 232) to (155, 75) then Renders a magenta box of size 70x60 starting at (398, 10) then Creates a black circular shape at (62, 83) with radius 33.
; PLAN: r0=43(x1), r1=232(y1), r2=155(x2), r3=75(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=398(x), r6=10(y), r7=70(width), r8=60(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=62(x), r11=83(y), r12=33(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 43
LDI r1, 232
LDI r2, 155
LDI r3, 75
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 398
LDI r6, 10
LDI r7, 70
LDI r8, 60
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 62
LDI r11, 83
LDI r12, 33
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
