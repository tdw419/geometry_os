; DESCRIPTION: Composite: Places a green 95x83 rectangle at position (19, 157) then Places a orange line segment connecting (469, 105) to (31, 124) then Creates a orange circular shape at (363, 101) with radius 69.
; PLAN: r0=19(x), r1=157(y), r2=95(width), r3=83(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=469(x1), r6=105(y1), r7=31(x2), r8=124(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=363(x), r11=101(y), r12=69(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 19
LDI r1, 157
LDI r2, 95
LDI r3, 83
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 469
LDI r6, 105
LDI r7, 31
LDI r8, 124
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 363
LDI r11, 101
LDI r12, 69
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
