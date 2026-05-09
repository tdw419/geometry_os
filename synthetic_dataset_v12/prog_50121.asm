; DESCRIPTION: Composite: Places a green dot at position (272, 15) then Draws a magenta line from (62, 0) to (78, 99) then Draws a purple circle centered at (442, 178) with radius 33.
; PLAN: r0=272(x), r1=15(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=62(x1), r6=0(y1), r7=78(x2), r8=99(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=442(x), r11=178(y), r12=33(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 272
LDI r1, 15
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 62
LDI r6, 0
LDI r7, 78
LDI r8, 99
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 442
LDI r11, 178
LDI r12, 33
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
