; DESCRIPTION: Composite: Renders a blue line between points (431, 158) and (278, 246) then Renders a orange box of size 31x97 starting at (464, 83) then Creates a purple circular shape at (377, 42) with radius 39.
; PLAN: r0=431(x1), r1=158(y1), r2=278(x2), r3=246(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=464(x), r6=83(y), r7=31(width), r8=97(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=377(x), r11=42(y), r12=39(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 431
LDI r1, 158
LDI r2, 278
LDI r3, 246
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 464
LDI r6, 83
LDI r7, 31
LDI r8, 97
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 377
LDI r11, 42
LDI r12, 39
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
