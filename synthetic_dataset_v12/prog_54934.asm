; DESCRIPTION: Composite: Places a white line segment connecting (352, 156) to (390, 240) then Draws a green circle centered at (247, 89) with radius 61 then Draws a orange rectangle at (294, 123) with width 91 and height 64.
; PLAN: r0=352(x1), r1=156(y1), r2=390(x2), r3=240(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=247(x), r6=89(y), r7=61(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=294(x), r11=123(y), r12=91(width), r13=64(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 352
LDI r1, 156
LDI r2, 390
LDI r3, 240
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 247
LDI r6, 89
LDI r7, 61
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 294
LDI r11, 123
LDI r12, 91
LDI r13, 64
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
