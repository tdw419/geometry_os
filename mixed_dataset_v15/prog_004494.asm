; DESCRIPTION: Composite: Places a yellow 38x62 rectangle at position (468, 35) then Places a yellow circle of radius 76 at center (158, 116) then Draws a yellow line from (263, 156) to (189, 59).
; PLAN: r0=468(x), r1=35(y), r2=38(width), r3=62(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=158(x), r6=116(y), r7=76(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=263(x1), r11=156(y1), r12=189(x2), r13=59(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 468
LDI r1, 35
LDI r2, 38
LDI r3, 62
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 158
LDI r6, 116
LDI r7, 76
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 263
LDI r11, 156
LDI r12, 189
LDI r13, 59
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
