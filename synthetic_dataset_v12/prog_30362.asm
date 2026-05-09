; DESCRIPTION: Composite: Places a white line segment connecting (259, 198) to (229, 199) then Draws a red circle centered at (363, 82) with radius 60 then Draws a cyan rectangle at (372, 53) with width 96 and height 84.
; PLAN: r0=259(x1), r1=198(y1), r2=229(x2), r3=199(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=363(x), r6=82(y), r7=60(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=372(x), r11=53(y), r12=96(width), r13=84(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 259
LDI r1, 198
LDI r2, 229
LDI r3, 199
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 363
LDI r6, 82
LDI r7, 60
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 372
LDI r11, 53
LDI r12, 96
LDI r13, 84
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
