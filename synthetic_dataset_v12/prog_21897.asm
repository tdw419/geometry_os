; DESCRIPTION: Composite: Places a yellow line segment connecting (34, 231) to (138, 229) then Renders a orange box of size 43x116 starting at (448, 18) then Places a red circle of radius 62 at center (157, 157).
; PLAN: r0=34(x1), r1=231(y1), r2=138(x2), r3=229(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=448(x), r6=18(y), r7=43(width), r8=116(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=157(x), r11=157(y), r12=62(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 34
LDI r1, 231
LDI r2, 138
LDI r3, 229
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 448
LDI r6, 18
LDI r7, 43
LDI r8, 116
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 157
LDI r11, 157
LDI r12, 62
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
