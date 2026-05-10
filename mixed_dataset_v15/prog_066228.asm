; DESCRIPTION: Composite: Renders a cyan line between points (506, 58) and (463, 68) then Renders a orange box of size 114x96 starting at (126, 55) then Creates a white circular shape at (272, 96) with radius 70.
; PLAN: r0=506(x1), r1=58(y1), r2=463(x2), r3=68(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=126(x), r6=55(y), r7=114(width), r8=96(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=272(x), r11=96(y), r12=70(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 506
LDI r1, 58
LDI r2, 463
LDI r3, 68
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 126
LDI r6, 55
LDI r7, 114
LDI r8, 96
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 272
LDI r11, 96
LDI r12, 70
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
