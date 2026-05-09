; DESCRIPTION: Composite: Draws a black circle centered at (410, 160) with radius 32 then Draws a white rectangle at (288, 106) with width 68 and height 62 then Draws a yellow line from (143, 231) to (82, 6).
; PLAN: r0=410(x), r1=160(y), r2=32(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=288(x), r6=106(y), r7=68(width), r8=62(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=143(x1), r11=231(y1), r12=82(x2), r13=6(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 410
LDI r1, 160
LDI r2, 32
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 288
LDI r6, 106
LDI r7, 68
LDI r8, 62
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 143
LDI r11, 231
LDI r12, 82
LDI r13, 6
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
