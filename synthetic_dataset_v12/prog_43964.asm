; DESCRIPTION: Composite: Places a green line segment connecting (27, 91) to (319, 40) then Renders a yellow box of size 68x78 starting at (444, 14) then Draws a red circle centered at (223, 234) with radius 14.
; PLAN: r0=27(x1), r1=91(y1), r2=319(x2), r3=40(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=444(x), r6=14(y), r7=68(width), r8=78(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=223(x), r11=234(y), r12=14(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 27
LDI r1, 91
LDI r2, 319
LDI r3, 40
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 444
LDI r6, 14
LDI r7, 68
LDI r8, 78
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 223
LDI r11, 234
LDI r12, 14
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
