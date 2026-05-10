; DESCRIPTION: Composite: Places a orange 18x94 rectangle at position (44, 87) then Places a orange line segment connecting (166, 75) to (457, 37) then Creates a purple circular shape at (255, 208) with radius 14.
; PLAN: r0=44(x), r1=87(y), r2=18(width), r3=94(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=166(x1), r6=75(y1), r7=457(x2), r8=37(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=255(x), r11=208(y), r12=14(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 44
LDI r1, 87
LDI r2, 18
LDI r3, 94
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 166
LDI r6, 75
LDI r7, 457
LDI r8, 37
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 255
LDI r11, 208
LDI r12, 14
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
