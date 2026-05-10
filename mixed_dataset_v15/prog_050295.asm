; DESCRIPTION: Composite: Places a magenta 11x49 rectangle at position (36, 95) then Renders a blue line between points (418, 106) and (272, 214) then Creates a yellow circular shape at (299, 123) with radius 57.
; PLAN: r0=36(x), r1=95(y), r2=11(width), r3=49(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=418(x1), r6=106(y1), r7=272(x2), r8=214(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=299(x), r11=123(y), r12=57(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 36
LDI r1, 95
LDI r2, 11
LDI r3, 49
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 418
LDI r6, 106
LDI r7, 272
LDI r8, 214
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 299
LDI r11, 123
LDI r12, 57
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
