; DESCRIPTION: Composite: Places a orange line segment connecting (77, 234) to (89, 127) then Places a red 53x87 rectangle at position (318, 98) then Renders a green disk with center (104, 226) and radius 23.
; PLAN: r0=77(x1), r1=234(y1), r2=89(x2), r3=127(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=318(x), r6=98(y), r7=53(width), r8=87(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=104(x), r11=226(y), r12=23(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 77
LDI r1, 234
LDI r2, 89
LDI r3, 127
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 318
LDI r6, 98
LDI r7, 53
LDI r8, 87
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 104
LDI r11, 226
LDI r12, 23
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
