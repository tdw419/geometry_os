; DESCRIPTION: Composite: Places a red line segment connecting (484, 97) to (371, 62) then Creates a cyan rectangular region at (209, 121) spanning 102 by 79 pixels then Creates a black circular shape at (291, 117) with radius 48.
; PLAN: r0=484(x1), r1=97(y1), r2=371(x2), r3=62(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=209(x), r6=121(y), r7=102(width), r8=79(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=291(x), r11=117(y), r12=48(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 484
LDI r1, 97
LDI r2, 371
LDI r3, 62
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 209
LDI r6, 121
LDI r7, 102
LDI r8, 79
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 291
LDI r11, 117
LDI r12, 48
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
