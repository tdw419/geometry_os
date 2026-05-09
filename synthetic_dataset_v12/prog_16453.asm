; DESCRIPTION: Composite: Places a magenta 23x73 rectangle at position (325, 110) then Places a cyan line segment connecting (505, 185) to (88, 207) then Creates a cyan circular shape at (72, 188) with radius 20.
; PLAN: r0=325(x), r1=110(y), r2=23(width), r3=73(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=505(x1), r6=185(y1), r7=88(x2), r8=207(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=72(x), r11=188(y), r12=20(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 325
LDI r1, 110
LDI r2, 23
LDI r3, 73
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 505
LDI r6, 185
LDI r7, 88
LDI r8, 207
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 72
LDI r11, 188
LDI r12, 20
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
