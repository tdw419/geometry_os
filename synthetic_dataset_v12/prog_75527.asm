; DESCRIPTION: Composite: Draws a white rectangle at (199, 49) with width 50 and height 112 then Places a yellow line segment connecting (212, 42) to (139, 78) then Creates a orange circular shape at (99, 202) with radius 26.
; PLAN: r0=199(x), r1=49(y), r2=50(width), r3=112(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=212(x1), r6=42(y1), r7=139(x2), r8=78(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=99(x), r11=202(y), r12=26(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 199
LDI r1, 49
LDI r2, 50
LDI r3, 112
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 212
LDI r6, 42
LDI r7, 139
LDI r8, 78
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 99
LDI r11, 202
LDI r12, 26
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
