; DESCRIPTION: Composite: Creates a yellow circular shape at (471, 214) with radius 30 then Draws a red line from (153, 170) to (156, 244) then Renders a black box of size 63x84 starting at (144, 94).
; PLAN: r0=471(x), r1=214(y), r2=30(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=153(x1), r6=170(y1), r7=156(x2), r8=244(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=144(x), r11=94(y), r12=63(width), r13=84(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 471
LDI r1, 214
LDI r2, 30
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 153
LDI r6, 170
LDI r7, 156
LDI r8, 244
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 144
LDI r11, 94
LDI r12, 63
LDI r13, 84
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
