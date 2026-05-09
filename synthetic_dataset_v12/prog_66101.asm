; DESCRIPTION: Composite: Places a black 94x85 rectangle at position (106, 36) then Renders a yellow line between points (189, 175) and (166, 137) then Creates a yellow circular shape at (69, 154) with radius 25.
; PLAN: r0=106(x), r1=36(y), r2=94(width), r3=85(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=189(x1), r6=175(y1), r7=166(x2), r8=137(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=69(x), r11=154(y), r12=25(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 106
LDI r1, 36
LDI r2, 94
LDI r3, 85
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 189
LDI r6, 175
LDI r7, 166
LDI r8, 137
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 69
LDI r11, 154
LDI r12, 25
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
